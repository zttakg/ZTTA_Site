module Constructor
  class DetailSerializer
    include MaterialHelper
    attr_accessor :resource

    def initialize(resource)
      @resource = resource
    end

    def serialize
      {
        shape: {
          id: resource.id
        }.merge(resource.json)
      }
    end
  end
end
