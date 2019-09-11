class IndividualOrder < ApplicationRecord
  include TemirtulparHelper::Model::IndividualOrder

  searchkick word_start: [:id]

  has_many :individual_items
  has_many :order_histories

  belongs_to :client

  enum person_type: PERSON_TYPE
  enum payment: PAYMENT
  enum delivery_method: DELIVERY_METHODS
  enum status: STATUSES

  # Only js validation

  def self.generate_id
    loop do
      uid = rand(100_000_000..999_999_999)
      break uid unless IndividualOrder.where(id: uid).exists?
    end
  end

  def search_data
    {
      id: id,
      client_id: client.id
    }
  end
end
