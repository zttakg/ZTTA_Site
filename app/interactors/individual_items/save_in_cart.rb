module IndividualItems
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
        name: context.name,
        svg: context.svg,
        load_type: context.load_type,
        status: :in_cart,
        width: context.width,
        height: context.height,
        cut_material_id: context.cut_material_id,
        cut_name: context.cut_material.cut.name,
        material_name: context.cut_material.material.name,
        material_thickness: context.cut_material.material.thickness,
        count: context.quantity.to_i,
        cut_length: context.calculation_svg.perimeter,
        area: context.calculation_svg.area,
        mass: context.detail_cost.mass,
        holes_count: context.calculation_svg.holes.count,
        preparation_days: context.preparation_time.calculation,
        price: context.detail_cost.calculation
      }
    end
  end
end
