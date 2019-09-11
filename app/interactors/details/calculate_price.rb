module Details
  class CalculatePrice
    include Interactor
    include MaterialHelper

    before  :prepare_specification,
            :prepare_data,
            :calculate_cost,
            :calculate_preparation_time

    def call
      context.price_data =
        {
          price: context.detail_cost.calculation,
          createDays: context.preparation_time.calculation,
          shapeType: context.spec.shape_type,
          cutTypeTitle: context.cut_material.cut.name,
          materialTitle: material_title(context.cut_material.material),
          count: context.spec.quantity,
          width: context.spec.detail_width,
          height: context.spec.detail_height,
          cutLength: context.calculation_svg.perimeter,
          area: context.calculation_svg.area,
          mass: context.detail_cost.mass
        }
    rescue StandardError => e
      Log::Services.exception('Details::CalculatePrice', 'call price_data', e)
      context.fail! errors: {critical: [I18n.t('errors.critical.price_data', code: CurrentThread.id)]}
    end

    private

    def prepare_specification
      context.spec = Components::Specification.new(context.detail_data)
      context.skip_validation.try(:map) { |key| context.spec.skip_validation_for!(key) }
      context.fail! errors: context.spec.errors unless context.spec.valid?
    end

    def prepare_data
      context.svg = Components::SVG.new(context.spec).build
      context.calculation_svg = DetailSVG::Calculation.new(context.svg)
    rescue StandardError => e
      Log::Services.exception('Details::CalculatePrice', 'prepare_data', e)
      context.fail! errors: {critical: [I18n.t('errors.critical.parsing', code: CurrentThread.id)]}
    end

    def calculate_cost
      const = Constant.first
      context.cut_material = CutMaterial.find(context.spec.cut_material_id)
      context.detail_cost = Details::Cost.new(
        const,
        context.cut_material,
        count: context.spec.quantity,
        holes_count: context.spec.holes.count,
        area: context.calculation_svg.area,
        perimeter: context.calculation_svg.perimeter
      )
    rescue StandardError => e
      Log::Services.exception('Details::CalculatePrice', 'calculate_cost', e)
      context.fail! errors: {critical: [I18n.t('errors.critical.cost_calculate', code: CurrentThread.id)]}
    end

    def calculate_preparation_time
      const = Constant.first
      context.preparation_time = Details::PreparationTime.new(
        const,
        context.cut_material,
        count: context.spec.quantity,
        holes_count: context.spec.holes.count,
        area: context.calculation_svg.area,
        perimeter: context.calculation_svg.perimeter
      )
    rescue StandardError => e
      Log::Services.exception('Details::CalculatePrice', 'calculate_preparation_time', e)
      context.fail! errors: {critical: [I18n.t('errors.critical.cost_calculate', code: CurrentThread.id)]}
    end
  end
end
