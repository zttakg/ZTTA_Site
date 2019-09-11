module DetailSVG
  module Elements
    class Circle
      include ServicesHelper
      attr_reader :args

      def initialize(args)
        @args = args
      end

      def radius
        round(args[:r])
      end

      def area
        round(Math::PI * radius**2)
      end

      # area with remains
      def raw_area
        round((radius * 2)**2)
      end

      def perimeter
        round(2 * Math::PI * radius)
      end
    end
  end
end
