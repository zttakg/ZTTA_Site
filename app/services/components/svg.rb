module Components
  class SVG
    attr_reader :specification

    def initialize(specification)
      @specification = specification
    end

    def build
      '<svg xmlns="http://www.w3.org/2000/svg"' \
        ' xml:space="preserve"' \
        ' version="1.1"' \
        ' xmlns:xlink="http://www.w3.org/1999/xlink"' \
        ' width="100%"' \
        ' height="100%"' \
        " viewBox=\"0 0 #{width} #{height}\">" \
          "<g id=\"body\">#{body}</g>" \
          "<g id=\"holes\">#{holes}</g>" \
      '</svg>'
    end

    def width
      specification.detail_width
    end

    def height
      specification.detail_height
    end

    private

    def body
      element(specification.attributes[:element], specification.attributes[:attrs])
    end

    def holes
      options = {fill: 'white'}
      specification.holes.map do |hole|
        element(hole.attributes[:element], hole.attributes[:attrs].merge(options))
      end.join('')
    end

    def element(name, attrs)
      el_attrs = attrs.map do |a|
        value =
          if specification.shape_type == :triangle && a.last.is_a?(Array)
            a.last.map { |pt| pt.join(',') }.join(' ')
          else
            a.last
          end

        "#{a.first}=\"#{value}\""
      end.join(' ')

      "<#{name} #{el_attrs}/>"
    end
  end
end
