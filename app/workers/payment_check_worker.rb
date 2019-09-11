require 'net/http'

class PaymentCheckWorker
  include Sidekiq::Worker
  sidekiq_options queue: 'site'

  def perform(order_id)
    order = IndividualOrder.find(order_id)

    case status(order_id)
    when 'Authorized', 'Paid'
      order.update(status: :proof_payment)
      order.order_histories.create(status_to: :proof_payment)
      Notifications::PaymentCheck.perform_async(fetch_telegram_ids, order_id)
    when 'Not Authorized'
      order.update(status: :payment_error)
      order.order_histories.create(status_to: :payment_error)
    end
  end

  private

  def status(order_id)
    uri = URI.parse('https://wpay.uniteller.ru/results/')
    params = {
      Format: '4',
      ShopOrderNumber: order_id,
      Shop_ID: ENV['SHOP_IDP'],
      Login: ENV['UNITELLER_LOGIN'],
      Password: ENV['UNITELLER_PASSWORD']
    }

    uri.query = URI.encode_www_form(params)
    res = Net::HTTP.get(uri)
    hash_reponse = Hash.from_xml(res)
    hash_reponse['unitellerresult']['orders']['order']['status'] unless hash_reponse['unitellerresult']['orders']['order'].nil?
  end

  def fetch_telegram_ids
    telegram_ids = []
    Employee.all.each do |employee|
      telegram_ids << employee.telegram_id if check_permission(employee)
    end
    telegram_ids
  end

  def check_permission(employee)
    employee.role &&
    employee.role.permission['notification'] &&
    employee.role.permission['notification'].include?('order_paid_by_card')
  end
end
