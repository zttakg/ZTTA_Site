class ServicesController < ApplicationController
  skip_before_action :authenticate_client!, :check_client_confirmation

  def index
    @services = Service.all
  end

  def show
    @contact = Contact.first
    @service = Service.find(params[:id])
  end
end
