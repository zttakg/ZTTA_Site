module Components
  class Specification
    include ServicesHelper
    attr_reader :data, :body_data, :errors

    def initialize(constructor_json)
      @data = constructor_json
      @body_data = data[shape_type]
      @errors = Components::Validator.new(self).errors
      Log::Services.info('Components::Specification', 'initialize', "data = #{data}, errors = #{errors}")
    end

    def shape_type
      data[:type]&.to_sym
    end

    def title
      data[:title]
    end

    def attributes
      @attributes ||= send("#{shape_type}_params")
    end

    def cut_type
      data[:cutType].to_s
    end

    def cut_material_id
      data[:material].to_i
    end

    def quantity
      data[:quantity].to_i
    end

    def detail_width
      case shape_type
      when :rectangle
        round(body_data[:width])
      when :circle
        round(body_data[:diameter])
      when :triangle
        round(body_data[:side1])
      else
        0
      end
    end

    def detail_height
      case shape_type
      when :rectangle
        round(body_data[:height])
      when :circle
        round(body_data[:diameter])
      when :triangle
        round(body_data[:side2])
      else
        0
      end
    end

    def holes
      @holes ||= data[:holes].map { |hole_json| Components::Hole.new(shape_type, detail_width, detail_height, hole_json[1]) }
    end

    def valid?
      errors.nil? || errors.empty?
    end

    def skip_validation_for!(key)
      errors.delete(key.to_s)
    end

    private

    def rectangle_params
      {
        element: :rect,
        attrs: {
          x: 0,
          y: 0,
          width:  round(body_data[:width]),
          height: round(body_data[:height]),
          rx:     round(body_data[:radius]),
          ry:     round(body_data[:radius])
        }
      }
    end

    def circle_params
      r = round(body_data[:diameter]) / 2
      {
        element: :circle,
        attrs: {
          cx: r,
          cy: r,
          r:  r
        }
      }
    end

    def triangle_params
      {
        element: :polygon,
        attrs: {
          points: [
            [0, 0],
            [0, round(body_data[:side1])],
            [round(body_data[:side2]), round(body_data[:side1])],
            [0, 0]
          ]
        }
      }
    end
  end
end
