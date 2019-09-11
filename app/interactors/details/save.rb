module Details
  class Save
    include Interactor

    def call
      context.detail.update(detail_params)
      context.fail! errors: context.detail.errors.messages unless context.detail.valid?
    end

    private

    def detail_params
      {
        name: context.spec.title,
        json: context.detail_data,
        svg: context.svg,
        load_type: :constructor,
        width: context.spec.detail_width,
        height: context.spec.detail_height,
        cut_material_id: context.spec.cut_material_id,
        count: context.spec.quantity,
        cut_length: context.calculation_svg.perimeter,
        area: context.calculation_svg.area,
        mass: context.detail_cost.mass,
        holes_count: context.spec.holes.count,
        price: context.detail_cost.calculation
      }
    end
  end
end
