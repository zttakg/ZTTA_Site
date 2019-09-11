module Constructor
  class ErrorsSerializer
    attr_accessor :model_errors

    SOURCE_KEYS = {
      name: 'title',
      count: 'quantity'
    }.freeze

    def initialize(model_errors)
      @model_errors = model_errors
    end

    def serialize
      {
        errors: errors.flatten
      }
    end

    private

    def errors
      model_errors.map do |model_error|
        source_name = SOURCE_KEYS[model_error.first] || model_error.first.to_s
        type = source_name == 'critical' ? 'critical' : 'validation'
        model_error.last.map do |message|
          {
            type: type,
            source: source_name,
            message: message,
            description: ''
          }
        end
      end
    end
  end
end
