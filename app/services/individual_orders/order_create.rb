module IndividualOrders
  class OrderCreate

    include TemirtulparHelper
    attr_reader :user, :order

    def initialize(user, order)
      @current_user = user
      @order = order
    end

    def run
      send_notification
    end

    private

    def send_notification
      phone_number = sanitize_db_phone_number(@order.phone_number)

      ids = fetch_telegram_ids
      SendNotificationJob.perform_async([phone_number], 'sms', "Ваш заказ '№ #{pretty_id(@order.id)}' принят и ожидает оплаты")
      SendNotificationJob.perform_async(ids, 'tg', "Новый заказ '№ #{pretty_id(@order.id)}'. Статус:  #{(humanize_order_status(@order.status))}.
       #{ENV['URL_ERP']}/individual_orders/#{@order.id}")

    end

    def fetch_telegram_ids
      roles = Role.where("permission ->> 'notification' LIKE '%order_new%' ")
      employees = Employee.where(role_id: roles.ids)
      telegram_ids = employees.pluck(:telegram_id).uniq
      telegram_ids
    end
  end
end