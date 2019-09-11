class DetailsController < ApplicationController
  before_action :fetch_detail, only: [:calculate_cost, :show, :destroy, :add_to_cart]
  before_action :list_details, only: [:index, :destroy, :filter]

  def index
    @details_count = current_client.details.count
  end

  def show
    respond_to do |format|
      format.svg do
        send_data @detail.svg, filename: "#{@detail.name}.svg", type: 'application/svg'
      end
    end
  end

  def filter
    if params[:filter] != 'all'
      @details = current_client.details.
                 where("json->>'type' = ?", params[:filter]).
                 page(params[:page])
    end

    @details_count = @details.count
  end

  def search
    query = params[:query].present? ? params[:query] : '*'
    result = Detail.search(query, where: {client_id: current_client.id}, fields: ['name'], match: :word_start)

    details_ids = result.pluck(:id)
    @details = Detail.where(id: details_ids).page(params[:page])
    @details_count = result.count
  end

  def calculate_cost
    result = Details::CalculatePriceSvg.call(
      svg: @detail.svg,
      quantity: params[:quantity],
      cut_material_id: @detail.cut_material.id
    )

    if result.success?
      render json: result.price_data, status: :ok
    else
      render_fail_response(result.errors)
    end
  end

  def destroy
    @detail.destroy
    @details_count = current_client.details.count
  end

  def add_to_cart
    new_detail = current_client.individual_items.new(id: IndividualItem.generate_id)
    result = IndividualItems::AddToCart.call(
      cart_item: new_detail,
      name: @detail.name,
      svg: @detail.svg,
      load_type: @detail.load_type,
      quantity: params[:quantity],
      width: @detail.width,
      height: @detail.height,
      cut_material: @detail.cut_material,
      cut_material_id: @detail.cut_material.id
    )

    if result.success?
      render json: {message: 'Добавлено в корзину'}, status: :ok
    else
      render json: {message: 'Произошла ошибка, попробуйте позже'}, status: :unprocessable_entity
    end
  end

  def update_cart_count;end

  private

  def fetch_detail
    @detail = current_client.details.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render_detail_not_found
  end

  def list_details
    @details = current_client.details.page(params[:page])
  end
end
