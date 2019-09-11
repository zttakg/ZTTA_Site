class IndividualItemsController < ApplicationController
  before_action :fetch_item, only: [:update_price, :calculate_price]
  before_action :cart_items, only: [:update_price]
  before_action :cart_sum, only: [:update_price]

  def calculate_price
    result = Details::CalculatePriceSvg.call(
      svg: @cart_item.svg,
      quantity: params[:quantity],
      cut_material_id: @cart_item.cut_material.id
    )

    if result.success?
      render json: result.price_data, status: :ok
    else
      render json: {error_message: 'Произошла ошибка попробуйте позже'}, status: :unprocessable_entity
    end
  end

  def update_price
    result = IndividualItems::AddToCart.call(
      cart_item: @cart_item,
      svg: @cart_item.svg,
      quantity: params[:quantity],
      cut_material: @cart_item.cut_material,
      cut_material_id: @cart_item.cut_material.id
    )

    if result.success?
      render json: {cart_item: result.cart_item, items_full_price: @cart_sum}, status: :ok
    else
      render json: {error_message: 'Произошла ошибка попробуйте позже'}, status: :unprocessable_entity
    end
  end

  def send_to_cart
    result = IndividualItems::ToCart.call(items_ids: params[:ids], current_client: current_client)

    if result.success?
      render json: {message: 'Добавлено в корзину'}, status: :ok
    else
      render json: {message: 'Произошла ошибка, попробуйте позже'}, status: :unprocessable_entity
    end
  end

  private

  def cart_sum
    sum = @cart_items.sum(:price)
    @cart_sum = sum >  Constant.first.min_order_sum ? sum :  Constant.first.min_order_sum
  end

  def cart_items
    @cart_items = current_client.cart_items
  end

  def fetch_item
    @cart_item = current_client.individual_items.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render_detail_not_found
  end
end
