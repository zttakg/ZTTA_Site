module Notifications
  class PasswordVerificationCodeWorker
    include Sidekiq::Worker
    include TemirtulparHelper::Services
    sidekiq_options queue: 'site'

    def perform(phone_number, code)
      Notification.new(phone_number, 'sms', code).send
    end
  end
end
