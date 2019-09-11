module DetailSVG
  module Geometry
    class Edge
      attr_reader :point1, :point2

      def initialize(point1, point2)
        @point1, @point2 = point1, point2
      end

      def length
        Math.hypot(point1.x - point2.x, point1.y - point2.y)
      end
    end
  end
end
