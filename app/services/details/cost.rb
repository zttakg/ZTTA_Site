module Details
  class Cost
    attr_reader :constant, :cut_material, :cut, :material, :detail

    def initialize(constant, cut_material, detail = {})
      @constant = constant
      @cut_material = cut_material
      @cut = cut_material.cut
      @material = cut_material.material
      @detail = detail
      logger
    end

    def calculation
      (
        details_count * detail_cost +
        overhead_cost * margin * cutting_preparation_time +
        material_preparation +
        programming_const
      ).ceil
    end

    # return gr
    # mm2 * mm * gr/cm3
    def mass
      (detail[:area] * material.thickness * material.density / 1000).ceil
    end

    private

    def details_count
      detail[:count]
    end

    # return KGS
    # KGS + hour * (KGS/hour + KGS/hour) + int * KGS/pierce
    def detail_cost
      detail_material +
      detail_cutting * (cut.consumable_cost + cut_material.consumption) +
      detail[:holes_count] * cut_material.pierce_price
    end

    # return KGS
    # gr * KGS/kg
    def detail_material
      mass * material.price_per_kg / 1000
    end

    # return hour
    # mm / mm/hour
    def detail_cutting
      detail[:perimeter].to_f / cut_material.speed
    end

    # return KGS/hour
    def overhead_cost
      cut.overhead_cost
    end

    # rerurn rate (float)
    def margin
      constant.margin
    end

    # return hour
    def cutting_preparation_time
      detail_cutting * details_count + constant.machine_preparation_time
    end

    def material_preparation
      constant.material_preparation_cost
    end

    def programming_const
      constant.programming_cost
    end

    def logger
      Log::Services.info('Details::Cost', 'initialize', "constant = #{constant.inspect}")
      Log::Services.info('Details::Cost', 'initialize', "cut_material = #{cut_material.inspect}")
      Log::Services.info('Details::Cost', 'initialize', "cut = #{cut.inspect}")
      Log::Services.info('Details::Cost', 'initialize', "material = #{material.inspect}")
      Log::Services.info('Details::Cost', 'initialize', "detail = #{detail}")
    end
  end
end
