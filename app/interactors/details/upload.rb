module Details
  class Upload
    include Interactor

    def call
      params = context.params
      attachment = params[:attachment]
      current_client = context.current_client

      cut_material = find_cut_material(params[:cut_id], params[:material_id])
      attachment_not_found if attachment.nil?

      detail = create_detail(current_client, cut_material, attachment, params)

      if detail.valid?
        context.status = :created
      else
        context.fail! status: :unprocessable_entity, errors: detail.errors
      end
    end

    private

    def create_detail(current_client, cut_material, attachment, params)
      current_client.details.create(
        cut_material: cut_material,
        name: params[:name],
        count: params[:count],
        status: Detail.statuses[:not_send],
        load_type: Detail.load_types[:custom],
        description: params[:description],
        attachment: attachment
      )
    end

    def attachment_not_found
      context.fail! status: :not_found, errors: {attachment: [I18n.t('errors.critical.upload_detail.not_found')]}
    end

    def find_cut_material(cut_id, material_id)
      cut_material = CutMaterial.find_by(cut_id: cut_id, material_id: material_id)

      if cut_material.present?
        cut_material
      else
        context.fail! errors: {critical: [I18n.t('errors.critical.cut_material')]}
      end
    end
  end
end
