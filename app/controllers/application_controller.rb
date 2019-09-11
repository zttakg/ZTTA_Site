class ApplicationController < ActionController::Base
  include TemirtulparHelper::View::PhoneNumberHelper
  protect_from_forgery with: :exception
  before_action :authenticate_client!
  before_action :check_client_confirmation

  def check_client_confirmation
    redirect_to clients_confirmation_path if current_client&.unconfirmed?
  end
end
