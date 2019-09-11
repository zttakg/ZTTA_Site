module IndividualOrders
  class TimeCalculator
    attr_reader :individual_items, :working_day

    def initialize(individual_items)
      @individual_items = individual_items
    end

    def production_time
      arr = []

      Cut.all.each do |cut|
        items = individual_items.where(cut_name: cut.name)
        arr << items.count * items.sum(:preparation_days)
      end

      arr.max
    end
  end
end
