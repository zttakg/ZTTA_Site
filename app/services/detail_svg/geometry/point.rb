module DetailSVG
  module Geometry
    class Point
      attr_reader :x, :y

      def initialize(x, y)
        @x, @y = x.to_f, y.to_f
      end

      def ==(other)
        x == other.x && y == other.y
      end
    end
  end
end
