module DetailSVG
  module Elements
    class Polygon
      include ServicesHelper
      attr_reader :vertices, :edges

      def initialize(args)
        # raise Errors::ParseAttributes, 'Eelements::Polygon parse points error' if args[:points].nil?

        @vertices = args[:points].split(' ').map do |point|
          pt = point.split(',')
          DetailSVG::Geometry::Point.new(pt[0], pt[1])
        end

        @edges = 1.upto(vertices.length - 1).map do |edge_index|
          DetailSVG::Geometry::Edge.new(vertices[edge_index - 1], vertices[edge_index])
        end
        @edges << DetailSVG::Geometry::Edge.new(@vertices.last, @vertices.first) unless @vertices.last == @vertices.first
      end

      def area
        sum = 0
        (0..vertices.length - 1).each do |i|
          a = vertices[i - 1]
          b = vertices[i]

          sum += ((a.x * b.y) - (a.y * b.x))
        end

        round((sum / 2).abs)
      end

      def perimeter
        round(@edges.sum(&:length))
      end
    end
  end
end
