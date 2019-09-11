module Constructor
  class InfoSerializer
    include MaterialHelper
    attr_accessor :cuts, :cut_material_ids

    def initialize(cuts)
      @cuts = cuts
      @cut_material_ids = []
    end

    def serialize
      {
        cutTypes: cut_types,
        cutMaterials: cut_materials
      }
    end

    private

    def cut_types
      cuts.map do |cut|
        {
          name: cut.name,
          cutMaterialIds: cut_material_ids_for(cut)
        }
      end
    end

    def cut_material_ids_for(cut)
      cut_materials = CutMaterial.where(cut_id: cut.id).includes(:material).order('materials.name asc, materials.thickness ')
      ids = cut_materials.map { |cm| cm.id.to_s }
      @cut_material_ids << ids
      ids
    end

    def cut_materials
      cut_materials_hash = {}
      CutMaterial.where(id: cut_material_ids.flatten).each do |cut_material|
        material = cut_material.material
        next unless material.in_stock
        cut_materials_hash[cut_material.id.to_s] =
          {
            id: cut_material.id.to_s,
            name: material_title(material),
            width: {
              min: 1,
              max: 3000
            },
            height: {
              min: 1,
              max: 6000
            },
            holeSize: {
              min: 0.9
            }
          }
      end
      cut_materials_hash
    end
  end
end
