module Notifications
  class PaymentCheck
    include Sidekiq::Worker
    include TemirtulparHelper::Services
    sidekiq_options queue: 'site'

    def perform(ids, order_id)
      message = "Заказ '№ #{order_id}' оплачен картой. Требует подтверждения оплаты"
      ids.each do |id|
        Notification.new(id, 'tg', message).send
      end
    end
  end
end
