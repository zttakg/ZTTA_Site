class PagesController < ApplicationController
  skip_before_action :authenticate_client!, :check_client_confirmation
  before_action :fetch_contact

  def index
    @about_us = PageElement.where(element_type: :about_us).first
    @slides = PageElement.where(element_type: :slide)
    @services = Service.first(4)
  end

  def about_us
    @about_us = PageElement.where(element_type: :about_us).first
  end

  def user_agreement
    @user_agreement = PageElement.where(element_type: :user_agreement).first
  end

  def privacy_policy
    @privacy_policy = PageElement.where(element_type: :privacy_policy).first
  end

  def delivery
    @deliveries = DeliveryPayment.delivery
    @payments = DeliveryPayment.payment
  end

  private

  def fetch_contact
    @contact = Contact.first
  end
end
