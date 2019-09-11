module Components
  class Hole
    include ServicesHelper

    attr_reader :shape_type, :detail_width, :detail_height, :data

    def initialize(shape_type, detail_width, detail_height, hole_json)
      @shape_type = shape_type
      @detail_width = detail_width
      @detail_height = detail_height
      @data = hole_json
    end

    def attributes
      @attributes ||= send("#{type}_params")
    end

    def id
      data[:id]
    end

    def position
      data[:position]
    end

    def position_points
      [position[:zeroPoint][shape_type], position[:zeroPoint][:hole]]
    end

    def type
      data[:type].to_sym
    end

    def circle?
      type == :circle
    end

    def inside_body?
      send("inside_#{shape_type}?")
    end

    private

    def rectangle_params
      {
        element: :rect,
        attrs: {
          x:      round(coordinates[:x]),
          y:      round(coordinates[:y]),
          width:  round(data[:width]),
          height: round(data[:height]),
          rx:     round(data[:radius]),
          ry:     round(data[:radius])
        }
      }
    end

    def circle_params
      {
        element: :circle,
        attrs: {
          cx: round(coordinates[:x]),
          cy: round(coordinates[:y]),
          r:  hole_radius
        }
      }
    end

    def coordinates
      @coordinates ||= send("coordinates_for_#{shape_type}")
    end

    def coordinates_for_rectangle
      hole_width  = circle? ? round(data[:diameter]) : round(data[:width])
      hole_height = circle? ? round(data[:diameter]) : round(data[:height])
      hole_x = round(position[:x])
      hole_y = round(position[:y])
      dx, dy = 0, 0

      coords =
        case position_points
        when ['top-left', 'center']
          {
            x: hole_x,
            y: hole_y
          }
        when ['top-right', 'center']
          {
            x: detail_width - hole_x,
            y: hole_y
          }
        when ['bottom-left', 'center']
          {
            x: hole_x,
            y: detail_height - hole_y
          }
        when ['bottom-right', 'center']
          {
            x: detail_width - hole_x,
            y: detail_height - hole_y
          }
        when ['top-left', 'side']
          {
            x: hole_x,
            y: hole_y
          }
        when ['top-right', 'side']
          {
            x: detail_width - hole_x - hole_width,
            y: hole_y
          }
        when ['bottom-left', 'side']
          {
            x: hole_x,
            y: detail_height - hole_y - hole_height
          }
        when ['bottom-right', 'side']
          {
            x: detail_width - hole_x - hole_width,
            y: detail_height - hole_y - hole_height
          }
        else
          {x: 0, y: 0}
        end

      dx, dy = dx - (hole_width / 2), dy - (hole_height / 2) if position_points.last == 'center'
      dx, dy = dx + (hole_width / 2), dy + (hole_height / 2) if circle?

      {x: coords[:x] + dx, y: coords[:y] + dy}
    end

    def coordinates_for_circle
      angle = round(position[:angle])
      attr_length = round(position[:l])
      figure_radius = detail_width / 2
      rad = angle * Math::PI / 180

      hypotinus =
        case position_points
        when ['center', 'center']
          attr_length
        when ['center', 'side']
          attr_length + hole_radius
        when ['side', 'center']
          figure_radius - attr_length
        when ['side', 'side']
          figure_radius - attr_length - hole_radius
        else
          0
        end

      {
        x: figure_radius + hypotinus * Math.sin(rad).round(2),
        y: figure_radius - hypotinus * Math.cos(rad).round(2)
      }
    end

    def hole_radius
      round(data[:diameter].to_f / 2)
    end

    def coordinates_for_triangle
      hole_diameter = round(data[:diameter])
      hole_x = round(position[:x])
      hole_y = round(position[:y])

      if position_points.last == 'center'
        {
          x: hole_x,
          y: detail_width - hole_y
        }
      elsif position_points.last == 'side'
        {
          x: hole_x + (hole_diameter / 2),
          y: detail_width - hole_y - (hole_diameter / 2)
        }
      else
        {x: 0, y: 0}
      end
    end

    def inside_rectangle?
      attrs = attributes[:attrs]

      points =
        if circle?
          {
            x1: attrs[:cx] - attrs[:r], y1: attrs[:cy] - attrs[:r],
            x2: attrs[:cx] + attrs[:r], y2: attrs[:cy] + attrs[:r]
          }
        else
          {
            x1: attrs[:x], y1: attrs[:y],
            x2: attrs[:x] + attrs[:width], y2: attrs[:y] + attrs[:height]
          }
        end

      access_area = {
        x1: 0 + BORDER_SIZE, y1: 0 + BORDER_SIZE,
        x2: detail_width - BORDER_SIZE, y2: detail_height - BORDER_SIZE
      }

      points[:x1] >= access_area[:x1] && points[:y1] >= access_area[:y1] &&
        points[:x2] <= access_area[:x2] && points[:y2] <= access_area[:y2]
    end

    def inside_circle?
      attrs = attributes[:attrs]
      body_center_point = detail_width / 2
      access_length = body_center_point - BORDER_SIZE - attrs[:r]
      return false if access_length.negative?

      (attrs[:cx] - body_center_point)**2 + (attrs[:cy] - body_center_point)**2 <= access_length**2
    end

    def inside_triangle?
      attrs = attributes[:attrs]
      triangle_points = [
        [0, 0],
        [0, detail_width],
        [detail_height, detail_width],
        [0, 0]
      ]

      point_inside_triangle?(attrs, triangle_points) && !circle_intercept_triangle?(attrs, triangle_points)
    end

    def point_inside_triangle?(ca, tp)
      a = (tp[0][0] - ca[:cx]) * (tp[1][1] - tp[0][1]) - (tp[1][0] - tp[0][0]) * (tp[0][1] - ca[:cy])
      b = (tp[1][0] - ca[:cx]) * (tp[2][1] - tp[1][1]) - (tp[2][0] - tp[1][0]) * (tp[1][1] - ca[:cy])
      c = (tp[2][0] - ca[:cx]) * (tp[0][1] - tp[2][1]) - (tp[0][0] - tp[2][0]) * (tp[2][1] - ca[:cy])

      (a >= 0 && b >= 0 && c >= 0) || (a <= 0 && b <= 0 && c <= 0)
    end

    def circle_intercept_triangle?(ca, tp)
      Array.new(3) { |i| circle_intercept_line?(ca, tp[i], tp[i + 1]) }.include?(true)
    end

    def circle_intercept_line?(ca, l1, l2)
      dist = Math.sqrt((l2[0] - l1[0])**2 + (l2[1] - l1[1])**2)
      d = [(l2[0] - l1[0]) / dist, (l2[1] - l1[1]) / dist]
      t = (d[0] * (ca[:cx] - l1[0])) + (d[1] * (ca[:cy] - l1[1]))
      Math.sqrt(((t * d[0] + l1[0]) - ca[:cx])**2 + ((t * d[1] + l1[1]) - ca[:cy])**2) < ca[:r].round + BORDER_SIZE
    end
  end
end
