class SendNotificationJob
  include Sidekiq::Worker
  include TemirtulparHelper::Services
  sidekiq_options queue: 'site'

  def perform(ids, type, message)
    ids.each do |id|
      Notification.new(id, type, message).send
    end
  end
end
