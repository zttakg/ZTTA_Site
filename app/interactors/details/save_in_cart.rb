module Details
  class SaveInCart
    include Interactor

    def call
      individual_item = context.cart_item
      individual_item.update(individual_item_params)

      context.fail! errors: individual_item.errors.messages unless individual_item.valid?
    end

    private

    def individual_item_params
      {
        name: context.spec.title,
        json: context.detail_data,
        svg: context.svg,
        load_type: :constructor,
        status: :in_cart,
        width: context.spec.detail_width,
        height: context.spec.detail_height,
        cut_material_id: context.spec.cut_material_id,
        cut_name: context.cut_material.cut.name,
        material_name: context.cut_material.material.name,
        material_thickness: context.cut_material.material.thickness,
        count: context.spec.quantity,
        cut_length: context.calculation_svg.perimeter,
        area: context.calculation_svg.area,
        mass: context.detail_cost.mass,
        holes_count: context.spec.holes.count,
        preparation_days: context.preparation_time.calculation,
        price: context.detail_cost.calculation
      }
    end
  end
end
