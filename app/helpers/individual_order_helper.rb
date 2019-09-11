module IndividualOrderHelper
  def convert_delivery_method(individual_order)
    case individual_order.delivery_method
    when 'delivery'
      'Доставка'
    when 'pick_up'
      'Самовывоз'
    end
  end

  def filter_by_status(individual_orders, status)
    case status
    when 'all'
      individual_orders.last.client.individual_orders.page(params[:page]).order(created_at: :desc)
    else
      orders = individual_orders.where(status: status).order(created_at: :desc)
      ind_orders = individual_orders.last.client.individual_orders.where(status: status)
      ind_orders.count <= 5 || orders.page(params[:page]).count.zero? ? ind_orders.page(1) : orders.page(params[:page])
    end
  end

  def convert_date(date)
    date&.strftime('%d.%m.%Y')
  end

  def convert_datetime(date)
    date&.strftime('%d.%m.%Y %H:%M')
  end
end
