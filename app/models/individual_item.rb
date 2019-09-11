class IndividualItem < ApplicationRecord
  mount_uploader :attachment, AttachmentUploader

  belongs_to :individual_order, optional: true
  belongs_to :cut_material, optional: true

  enum status: [:in_cart, :pending]
  enum load_type: [:constructor, :custom]

  def self.generate_id
    loop do
      uid = rand(100_000_000..999_999_999)
      break uid unless IndividualItem.where(id: uid).exists?
    end
  end
end
