module DetailSVG
  module Elements
    class Rectangle
      include ServicesHelper
      attr_reader :args

      def initialize(args)
        @args = args
      end

      def width
        round(args[:width])
      end

      def height
        round(args[:height])
      end

      def corner_radius
        round(args[:rx])
      end

      def netto_area
        rectangle_area = width * height
        rectangle_area -= corners_area if corner_radius.positive?
        round(rectangle_area)
      end

      def area
        rectangle_area = width * height
        round(rectangle_area)
      end

      def perimeter
        rectangle_perimeter = (width + height) * 2
        rectangle_perimeter -= corners_perimeter if corner_radius.positive?
        round(rectangle_perimeter)
      end

      private

      def corners_area
        corners_full_area = corner_radius**2 * 4
        corners_cirle_area = Math::PI * corner_radius**2
        corners_full_area - corners_cirle_area
      end

      def corners_perimeter
        corners_full_perimeter = corner_radius * 8
        corners_cirle_perimeter = 2 * Math::PI * corner_radius
        corners_full_perimeter - corners_cirle_perimeter
      end
    end
  end
end
