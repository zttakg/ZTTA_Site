class RegistrationsController < Devise::RegistrationsController
  include TemirtulparHelper::View::PhoneNumberHelper
  before_action :check_current_client, only: [:confirmation, :confirmation_action, :resend_confirmation]
  skip_before_action :check_client_confirmation, only: [:confirmation, :confirmation_action, :resend_confirmation]
  before_action :attempts, only: [:confirmation_action]

  def create
    build_resource(sign_up_params)

    resource.save
    yield resource if block_given?
    if resource.persisted?
      if resource.active_for_authentication?
        set_flash_message! :notice, :signed_up
        sign_up(resource_name, resource)
        current_client.generate_confirmation_token!
        send_verification_code
        Cart::UpdateCartSession.call(client: current_client, cart_session_id: session[:cart_session])
        respond_with resource, location: clients_confirmation_path
      else
        set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end
  end

  def confirmation; end

  def confirmation_action
    if current_client.confirmation_token == params[:code]
      current_client.confirm!
      redirect_to root_path
    else
      redirect_to clients_confirmation_path(redirect: :incorrect_code)
    end
  end

  def resend_confirmation
    current_client.generate_confirmation_token!
    send_verification_code
    redirect_to clients_confirmation_path(redirect: :resend)
  end

  def edit_password
    authenticate_scope!
    set_minimum_password_length
  end

  def update_password
    authenticate_scope!

    if resource.update_with_password(update_password_params)
      bypass_sign_in resource, scope: resource_name
      respond_with resource, location: after_update_path_for(resource)
    else
      clean_up_passwords resource
      set_minimum_password_length
      render :edit_password
    end
  end

  def update
    if resource.update(account_update_params)
      redirect_to cabinet_path
    else
      render :edit
    end
  end

  private

  def sign_up_params
    _params = params.require(:client).permit(:email, :name, :last_name, :phone_number, :password, :password_confirmation, :eula)
    _params[:phone_number] = sanitize_params_phone_number(_params[:phone_number])
    _params
  end

  def account_update_params
    # TODO :phone_number is not updated
    params.require(:client).permit(
      :name, :last_name, :email,
      :company_name, :company_INN, :company_legal_address, :company_address,
      :bank_name, :settlement_account, :company_BIC, :city, :company_OKPO
    )
  end

  def update_password_params
    params.require(:client).permit(:password, :password_confirmation, :current_password)
  end

  def update_resource(resource, params)
    resource.update_without_password(params)
  end

  def check_current_client
    redirect_to root_path unless current_client.present?
  end

  def send_verification_code
    Notifications::VerificationCodeWorker.perform_async(
      sanitize_db_phone_number(current_client.phone_number),
      current_client.confirmation_token
    )
  end

  def attempts
    session[:attempts] = 1 unless session[:attempts].present?

    if session[:attempts] < 3
      session[:attempts] += 1
    else
      session.delete(:attempts)
      current_client.generate_confirmation_token!
      send_verification_code
      redirect_to clients_confirmation_path(redirect: :resend)
    end
  end
end
