module Details
  class CalculatePriceSvg
    include Interactor
    include MaterialHelper

    before  :calculation_svg,
            :calculate_cost,
            :calculate_preparation_time

    def call
      context.price_data = {price: context.detail_cost.calculation}
    rescue StandardError => e
      Log::Services.exception('Details::CalculatePriceSvg', 'call price_data', e)
      context.fail! errors: e.message
    end

    private

    def calculation_svg
      context.calculation_svg = DetailSVG::Calculation.new(context.svg)
    rescue StandardError => e
      Log::Services.exception('Details::CalculatePriceSvg', 'calculation_svg', e)
      context.fail! errors: e.message
    end

    def calculate_cost
      context.const = Constant.first
      context.cut_material = CutMaterial.find(context.cut_material_id)

      context.detail_cost = Details::Cost.new(
        context.const,
        context.cut_material,
        count: context.quantity.to_i,
        holes_count: context.calculation_svg.holes.count,
        area: context.calculation_svg.area,
        perimeter: context.calculation_svg.perimeter
      )
    end

    def calculate_preparation_time
      context.preparation_time = Details::PreparationTime.new(
        context.const,
        context.cut_material,
        count: context.quantity.to_i,
        holes_count: context.calculation_svg.holes.count,
        area: context.calculation_svg.area,
        perimeter: context.calculation_svg.perimeter
      )
    rescue StandardError => e
      Log::Services.exception('Details::CalculatePrice', 'calculate_preparation_time', e)
      context.fail! errors: {critical: [I18n.t('errors.critical.cost_calculate', code: CurrentThread.id)]}
    end
  end
end
