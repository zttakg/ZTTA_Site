class PasswordController < ApplicationController
  skip_before_action :authenticate_client!
  before_action :fetch_client, only: [:auth_action, :verify, :verify_action]
  before_action :fetch_client_by_token, only: [:edit, :update]
  before_action :attempts, only: [:verify_action]
  before_action :validate_password, only: [:update]

  def auth
  end

  def auth_action
    if @client.present?
      @client.generate_sms_code!
      Notifications::PasswordVerificationCodeWorker.perform_async(
        sanitize_db_phone_number(@client.phone_number),
        @client.reset_password_token
      )
      redirect_to password_verify_path(phone_number: params[:phone_number])
    else
      @error = {message: 'Сотрудник не найден'}
      render :auth
    end
  end

  def verify
    redirect_to root_path unless @client.present?
  end

  def verify_action
    if @client.reset_password_token == params[:code]
      @client.generate_password_token!
      redirect_to password_edit_path(token: @client.reset_password_token)
    else
      @error = {message: 'Неверный код'}
      render :verify
    end
  end

  def edit
  end

  def update
    if @client.update(password: params[:password])
      @client.update_column(:reset_password_token, nil)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def fetch_client
    phone_number = sanitize_params_phone_number(params[:phone_number])
    return unless phone_number.present?
    @client = Client.find_by(phone_number: phone_number)
  end

  def fetch_client_by_token
    redirect_to root_path unless params[:token].present?
    @client = Client.find_by(reset_password_token: params[:token])
    redirect_to root_path unless @client.present?
  end

  def attempts
    session[:attempts] = 1 unless session[:attempts].present?

    if session[:attempts] < 3
      session[:attempts] += 1
    else
      session.delete(:attempts)
      redirect_to root_path
    end
  end

  def validate_password
    @error = {message: 'Введите пароль'} unless params[:password].present?
    @error = {message: 'Пароли не совпадают'} if params[:password] != params[:password_confirmation]

    render :edit if @error.present?
  end
end
