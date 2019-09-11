class Detail < ApplicationRecord
  mount_uploader :attachment, AttachmentUploader

  belongs_to :client
  belongs_to :cut_material

  searchkick word_start: [:name]

  validates :name, presence: true, uniqueness: {scope: :client_id}
  validates :count, presence: true, numericality: {greater_than: 0}
  validates :cut_material_id, presence: true

  enum load_type: [:constructor, :custom]
  enum status: %i[not_send expects_assessed assessed not_assessed appraised]

  scope :custom_not_send, -> { where(status: Detail.statuses[:not_send], load_type: Detail.load_types[:custom]) }

  def search_data
    {
      name: name,
      client_id: client.id
    }
  end
end
