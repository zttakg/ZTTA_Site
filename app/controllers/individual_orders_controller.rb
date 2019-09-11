class IndividualOrdersController < ApplicationController
  before_action :fetch_order, only: [:show, :thx]
  before_action :check_individual_order, only: :create

  def index
    @status = params[:status].to_s
    date = session['date_by' + @status]
    @orders = find_orders(date).page(params[:page])
  end

  def filter
    @status = params[:status].to_s
    date = filter_by_date(value: params[:value])
    @orders = find_orders(date).page(params[:page])

    session['date_by' + @status] = date
  end

  def search
    query = params[:query].present? ? params[:query] : '*'
    result = IndividualOrder.search(
      query, where: {client_id: current_client.id}, fields: ['id'], match: :word_start, misspellings: false
    )

    @status = params[:status].to_s
    orders_ids = result.pluck(:id)
    @orders = IndividualOrder.where(id: orders_ids).page(params[:page])
  end

  def show
    @individual_items = @individual_order.individual_items.page(params[:page])
    respond_pdf
  end

  def new
    @cart_items = current_client.cart_items
    @items_count = @cart_items.size

    redirect_to cart_index_path if @items_count < 1

    @user_discount = @current_client.discount.nil? ? 0 : @current_client.discount
    @items_sum = @cart_items.sum(:price)
    @items_sum_with_user_discount = @items_sum - @items_sum * (@user_discount / 100.0)
    @order_id = IndividualOrder.generate_id
    @signature = signature(@order_id, @items_sum_with_user_discount)

    session[current_client.id.to_s + '_order_id'] = @order_id
  end

  def create
    order_id = session[current_client.id.to_s + '_order_id']

    result = IndividualOrders::Create.call(
      client_id: current_client.id,
      individual_params: individual_order_params,
      legal_params: legal_order_params,
      order_id: order_id
    )
    IndividualOrders::OrderCreate.new(current_client, result.order).run
    PaymentCheckWorker.perform_async(order_id) if params[:payment].include?('card')
    redirect_to thx_individual_order_path(result.order)
  end

  def thx
    @user_discount = @current_client.discount.nil? ? 0 : @current_client.discount
    @items_sum = @individual_order.individual_items.sum(:price)
    @items_sum_with_user_discount = @items_sum - @items_sum * (@user_discount / 100.0)
    respond_pdf
  end

  private

  def check_individual_order
    order_id = session[current_client.id.to_s + '_order_id']
    individual_order = IndividualOrder.find_by(id: order_id)
    if individual_order.present?
      flash[:notice] = "Заказ № #{order_id.to_s.gsub(/.{3}(?=.)/, '\0-')} уже создан"
      redirect_to individual_orders_path
    end
  end

  def respond_pdf
    respond_to do |format|
      format.html
      format.pdf do
        pdf = OrderPdf.new(@individual_order)
        send_data pdf.render, filename: "заказ_#{@individual_order.id}.pdf", type: 'application/pdf'
      end
    end
  end

  def fetch_order
    @individual_order = current_client.individual_orders.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render_detail_not_found
  end

  def filter_by_date(value: nil)
    case value
    when 'one'
      Date.current - 1.month
    when 'three'
      Date.current - 3.month
    else
      Date.current - 6.month
    end
  end

  def filter_by_status(individual_orders, status)
    case status
    when 'all'
      individual_orders
    else
      individual_orders.where(status: status)
    end
  end

  def find_orders(date)
    date = date.present? ? date.to_datetime : filter_by_date

    orders = IndividualOrder.where(
      'created_at >= :date AND client_id = :client_id',
      date: date,
      client_id: current_client.id
    )

    if params[:status] && params[:status] != 'all'
      orders.where(status: params[:status])
    else
      orders
    end

  end

  def md5(value)
    Digest::MD5.hexdigest(value.to_s)
  end

  def signature(order_id, total_price)
    md5(
      md5(ENV['SHOP_IDP']) + '&' + md5(order_id.to_s) + '&' + md5(total_price.to_s) + '&' +
      md5('1') + '&' + md5('') + '&' + md5('') + '&' + md5('') + '&' +
      md5('') + '&' + md5('') + '&' + md5('') + '&' +
      md5(ENV['UNITELLER_PASSWORD'])
    ).upcase
  end

  def individual_order_params
    params.permit(
      :name, :last_name, :phone_number, :client_address, :city, :email,
      :comment, :payment, :delivery_method, :person_type, :delivery_address
    )
  end

  def legal_order_params
    params.permit(
      :city, :contact_person_email, :comment, :payment, :delivery_method, :person_type,
      :company_city, :company_name, :company_INN, :company_legal_address, :delivery_address,
      :company_address, :bank_name, :bank_address, :settlement_account, :company_BIC, :company_OKPO,
      :contact_person_name, :contact_person_last_name, :contact_person_phone_number
    )
  end
end
