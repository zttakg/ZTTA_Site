module IndividualItems
  class ToCart
    include Interactor

    def call
      client = context.current_client

      individual_items = client.individual_items.where(id: context.items_ids)
      create_items(individual_items, client)
    end

    private

    def create_items(individual_items, client)
      individual_items.each do |item|

        new_detail = client.individual_items.new(id: IndividualItem.generate_id)
        IndividualItems::AddToCart.call(

            cart_item: new_detail,
            svg: item.svg,
            quantity: item.count,
            load_type: item.load_type,
            name: item.name,
            cut_material: item.cut_material,
            cut_material_id: item.cut_material.id
        )
      end
    end
  end
end
