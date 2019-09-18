module DetailSVG
  class Calculation
    include ServicesHelper

    DIRECTIONS = {
      rect: DetailSVG::Elements::Rectangle,
      polygon: DetailSVG::Elements::Polygon,
      circle: DetailSVG::Elements::Circle
    }.freeze

    attr_reader :body, :holes

    def initialize(xml_data)
      parse(Ox.load(xml_data, mode: :hash))
    end

    # was: round(body_area - holes_area).ceil
    def area
      round(body_area).ceil
    end

    def _area
      round(body_area - holes_area).ceil
    end

    def perimeter
      round(body_perimeter + holes_perimeter).ceil
    end

    def body_area
      round(body.area)
    end

    def body_perimeter
      round(body.perimeter)
    end

    def holes_area
      round(holes.sum(&:area))
    end

    def holes_perimeter
      round(holes.sum(&:perimeter))
    end

    private

    def parse(xml_hash)
      xml_hash[:svg].each do |el|
        g = el[:g]
        next unless g.is_a?(Array)
        id = g[0][:id].to_sym
        send("parse_#{id}", g.drop(1))
      end
    end

    def parse_body(attrs)
      figure_el = attrs[0]
      figure_name = figure_el.keys[0]
      @body = DIRECTIONS[figure_name].new(figure_el[figure_name][0])
    end

    def parse_holes(attrs)
      @holes = attrs.map do |figure_el|
        figure_name = figure_el.keys[0]
        DIRECTIONS[figure_name].new(figure_el[figure_name][0])
      end
    end
  end
end
