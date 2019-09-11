class CartController < ApplicationController
  skip_before_action :authenticate_client!, :check_client_confirmation, only: [:index, :update_price, :destroy]
  before_action :cart_info, only: [:index]
  before_action :fetch_item, only: [:update_price, :show, :destroy]

  def update_price
    IndividualItems::AddToCart.call(
      cart_item: @cart_item,
      svg: @cart_item.svg,
      load_type: @cart_item.load_type,
      name: @cart_item.name,
      quantity: params[:quantity],
      cut_material: @cart_item.cut_material,
      cut_material_id: @cart_item.cut_material.id
    )

    cart_info
  end

  def show
    respond_to do |format|
      format.svg do
        send_data @cart_item.svg, filename: "#{@cart_item.name}.svg", type: 'application/svg'
      end
    end
  end

  def destroy
    @cart_item.destroy
    render json: {message: 'ok'}, status: :ok
  end

  private

  def cart_info
    cart_items_rel =
      if current_client.present?
        current_client.cart_items
      else
        Client.session_cart_items(session[:cart_session])
      end
    @cart_items = cart_items_rel.page(params[:page])
    @cart_items_count = cart_items_rel.count
    @cart_items_sum = cart_items_rel.sum(:price)
    @total_payment = @cart_items_sum > Constant.first.min_order_sum ? @cart_items_sum : Constant.first.min_order_sum
  end

  def fetch_item
    @cart_item =
      if current_client.present?
        current_client.cart_items.find(params[:id])
      else
        Client.session_cart_items(session[:cart_session]).find(params[:id])
      end
  rescue ActiveRecord::RecordNotFound
    render_detail_not_found
  end
end
