class ConstructorController < ApplicationController
  layout 'constructor'

  skip_before_action :verify_authenticity_token
  skip_before_action :authenticate_client!, :check_client_confirmation, only: [:show, :info, :cost, :add_to_cart]
  before_action :fetch_detail, only: [:shape, :shape_update, :destroy_detail]
  before_action :fetch_order_detail, only: :order_shape
  before_action :find_customs, only: [:attachment, :upload, :send_drawing]

  def info
    @cuts = Cut.order(name: :asc)
    render json: Constructor::InfoSerializer.new(@cuts).serialize, status: :ok
  end

  def shape
    render json: Constructor::DetailSerializer.new(@detail).serialize, status: :ok
  end

  def order_shape
    render json: Constructor::DetailSerializer.new(@individual_item).serialize, status: :ok
  end

  def attachment
    @cuts = Cut.all
  end

  def save
    result = Details::AddToList.call(detail: current_client.details.new, detail_data: constructor_params)

    if result.success?
      render json: Constructor::DetailSerializer.new(result.detail).serialize, status: :ok
    else
      render_fail_response(result.errors)
    end
  end

  def shape_update
    result = Details::AddToList.call(detail: @detail, detail_data: constructor_params)

    if result.success?
      render json: Constructor::DetailSerializer.new(result.detail).serialize, status: :ok
    else
      render_fail_response(result.errors)
    end
  end

  def cost
    result = Details::CalculatePrice.call(detail_data: constructor_params, skip_validation: [:title])

    if result.success?
      render json: {cost: result.price_data}, status: :ok
    else
      render_fail_response(result.errors)
    end
  end

  def add_to_cart
    new_detail =
      if current_client.present?
        current_client.individual_items.new(id: IndividualItem.generate_id)
      else
        IndividualItem.new(id: IndividualItem.generate_id, cart_session_id: cart_session)
      end

    result = Details::AddToCart.call(cart_item: new_detail, detail_data: constructor_params)

    if result.success?
      render json: {success: {redirectTo: cart_index_path}}, status: :ok
    else
      render_fail_response(result.errors)
    end
  end

  def upload
    result = Details::Upload.call(params: params, current_client: current_client)
    return @error_message = result.errors.values[0].first unless result.success?
    @message = 'Чертеж добавлен!'
  end

  def select
    material_ids = CutMaterial.where(cut_id: params[:cut_id]).pluck(:material_id)
    @materials = Material.where(id: material_ids, in_stock: true).order('name asc, thickness ')
  end

  def send_drawing
    details_ids = JSON.parse(params[:details_ids])
    details = @details.where(id: details_ids)
    ids = fetch_telegram_ids
    details.each do | detail|
      SendNotificationJob.perform_async([current_client.phone_number], 'sms', "Деталь '#{detail.name}' принята и ожидает оценки")
      SendNotificationJob.perform_async(ids, 'tg', "Новая деталь '#{detail.name}'. Статус:  ожидает оценки.
       #{ENV['URL_ERP']}/details/#{detail.id}")
    end
    details.update_all(status: Detail.statuses[:expects_assessed])

  end

  def destroy_detail
    @detail.destroy
    @details = current_client.details.custom_not_send
  end

  private

  def fetch_detail
    @detail = current_client.details.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render_detail_not_found
  end

  def fetch_order_detail
    @individual_item = current_client.individual_items.constructor.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render_detail_not_found
  end

  def find_customs
    @details = current_client.details.custom_not_send
  end

  def fetch_telegram_ids
    roles = Role.where("permission ->> 'notification' LIKE '%detail_new%' ")
    employees = Employee.where(role_id: roles.ids)
    telegram_ids = employees.pluck(:telegram_id).uniq
    telegram_ids
  end

  def constructor_params
    params[:shape].permit!.to_h.deep_symbolize_keys
  rescue StandardError
    {}
  end

  def render_detail_not_found
    error = {critical: [I18n.t('errors.critical.detail.not_found')]}
    render json: Constructor::ErrorsSerializer.new(error).serialize, status: :not_found
  end

  def render_fail_response(errors)
    render json: Constructor::ErrorsSerializer.new(errors).serialize, status: :unprocessable_entity
  end

  def cart_session
    session[:cart_session] ||= rand(999_999_999)
  end
end
