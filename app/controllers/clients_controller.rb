class ClientsController < ApplicationController
  def cabinet
    # my orders
    completed_orders = current_client.individual_orders.where(status: IndividualOrder.statuses[:finished])

    @orders_count = current_client.individual_orders.size
    @compaleted_orders_count = completed_orders.size
    @sum_for_orders = completed_orders.sum(:total_price)

    # my cart
    individual_items = current_client.individual_items
    @ordered_details = individual_items.size

    @details_quantity = individual_items.sum(:count)
    @sum_for_cart = individual_items.sum(:price)

    # my details
    @details_count = current_client.details.size
    @constructor_details_count = current_client.details.where(load_type: Detail.load_types[:constructor]).size
    @custom_details_count = current_client.details.where(load_type: Detail.load_types[:custom]).size
  end
end
