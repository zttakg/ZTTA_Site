class SessionsController < Devise::SessionsController
  include TemirtulparHelper::View::PhoneNumberHelper
  skip_before_action :check_client_confirmation, only: :destroy

  def create
    resource = Client.find_for_database_authentication phone_number: sanitize_params_phone_number(params[:client][:phone_number])
    return invalid_login_attempt unless resource

    if resource.valid_password? params[:client][:password]
      sign_in :client, resource
      Cart::UpdateCartSession.call(client: resource, cart_session_id: session[:cart_session])
      return redirect_to after_sign_in_path_for(resource)
    end

    invalid_login_attempt
  end

  private

  def invalid_login_attempt
    redirect_to new_client_session_path
  end

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || root_path
  end
end
