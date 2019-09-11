module Api
  class DetailsController < ApplicationController
    skip_before_action :authenticate_client!, :check_client_confirmation
    skip_before_action :verify_authenticity_token

    before_action :fetch_detail

    def calculation_svg
      result = Details::CalculatePriceSvg.call(
        svg: params[:svg],
        quantity: @detail.count,
        cut_material_id: @detail.cut_material.id
      )

      if result.success?
        render json: result.price_data, status: :ok
      else
        render json: {error_message: 'Проверьте корректность SVG формата'}, status: :unprocessable_entity
      end
    end

    private

    def fetch_detail
      @detail = Detail.find(params[:detail_id])
    rescue ActiveRecord::RecordNotFound
      render json: {error_message: 'Деталь не найдена'}, status: :unprocessable_entity
    end
  end
end
