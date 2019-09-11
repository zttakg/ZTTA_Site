module Details
  class PreparationTime
    attr_reader :programming_time, :cut_material, :cut, :material, :detail

    def initialize(constant, cut_material, detail = {})
      @programming_time = constant.programming_time
      @cut_material = cut_material
      @cut = cut_material.cut
      @material = cut_material.material
      @detail = detail
    end

    def calculation
      ((1.2 * (detail_cutting + (detail_area / leaf_area).ceil * 0.1 + programming_time)) / 60).ceil
    end

    private

    def details_count
      detail[:count]
    end

    def detail_area
      detail[:area]
    end

    def leaf_area
      material.width_max * material.height_max
    end

    def detail_cutting
      details_count * (detail[:perimeter].to_f / cut_material.speed)
    end
  end
end
