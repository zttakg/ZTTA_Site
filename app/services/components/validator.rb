module Components
  class Validator
    include ServicesHelper

    attr_reader :specification, :skip_validations, :errors

    def initialize(specification)
      @specification = specification
      @skip_validations = skip_validations
      @errors = {}
      validate_data
    end

    private

    def validate_data
      validate_specification
      return if errors.present?

      validate_title
      validate_cut
      validate_cut_material_id
      validate_quantity
      validate_rectangle if specification.shape_type == :rectangle
      validate_circle if specification.shape_type == :circle
      validate_triangle if specification.shape_type == :triangle
      validate_holes
    end

    def add_error(key, message)
      (errors[key] ||= []) << message
    end

    def validate_specification
      return if specification.data.present? && specification.body_data.present?

      Log::Services.error(
        'Components::Validator',
        'validate_specification',
        "specification.data.present? = #{specification.data.present?} | " \
        "specification.body_data.present? = #{specification.body_data.present?}"
      )
      add_error('critical', I18n.t('errors.critical.parsing', code: CurrentThread.id))
    end

    def validate_title
      return if specification.title.present?

      translate_key = 'activerecord.errors.models.detail.attributes.name.blank'
      add_error('title', I18n.t(translate_key))
    end

    def validate_cut
      return if specification.cut_type.present?

      translate_key = 'activerecord.errors.models.detail.attributes.cut.blank'
      add_error('cutType', I18n.t(translate_key))
    end

    def validate_cut_material_id
      return if specification.cut_material_id.positive?

      translate_key = 'activerecord.errors.models.detail.attributes.cut_material_id.blank'
      add_error('material', I18n.t(translate_key))
    end

    def validate_quantity
      return if specification.quantity.positive?

      translate_key = 'activerecord.errors.models.detail.attributes.count.greater_than'
      add_error('quantity', I18n.t(translate_key))
    end

    def validate_rectangle
      width_translate_key = 'activerecord.errors.models.detail.attributes.detail_width.greater_than'
      height_translate_key = 'activerecord.errors.models.detail.attributes.detail_height.greater_than'
      radius_translate_key = 'activerecord.errors.models.detail.attributes.detail_radius.greater_than'

      add_error('rectangle.width', I18n.t(width_translate_key)) unless specification.body_data[:width].to_i.positive?
      add_error('rectangle.height', I18n.t(height_translate_key)) unless specification.body_data[:height].to_i.positive?
      add_error('rectangle.radius', I18n.t(radius_translate_key)) if specification.body_data[:radius].to_i.negative?
    end

    def validate_circle
      return if specification.body_data[:diameter].to_i.positive?

      diameter_translate_key = 'activerecord.errors.models.detail.attributes.diameter_width.greater_than'
      add_error('circle.diameter', I18n.t(diameter_translate_key))
    end

    def validate_triangle
      width_translate_key = 'activerecord.errors.models.detail.attributes.detail_width.greater_than'
      height_translate_key = 'activerecord.errors.models.detail.attributes.detail_height.greater_than'

      add_error('triangle.side1', I18n.t(width_translate_key)) unless specification.body_data[:side1].to_i.positive?
      add_error('triangle.side2', I18n.t(height_translate_key)) unless specification.body_data[:side2].to_i.positive?
    end

    def validate_holes
      specification.holes.each { |hole| validate_hole(hole) }
    end

    def validate_hole(hole)
      attrs = hole.attributes[:attrs]
      check_attrs =
        if hole.circle?
          hole.position[:l].to_i.negative? || hole.position[:angle].to_i.negative? || attrs[:r] < BORDER_SIZE
        else
          attrs[:width] < BORDER_SIZE || attrs[:height] < BORDER_SIZE || attrs[:rx].negative?
        end

      negative_error = 'activerecord.errors.models.detail.attributes.holes.negative'
      return add_error("holes.#{hole.id}", I18n.t(negative_error)) if check_attrs

      outside_error = 'activerecord.errors.models.detail.attributes.holes.outside'
      add_error("holes.#{hole.id}", I18n.t(outside_error)) unless hole.inside_body?
    end
  end
end
