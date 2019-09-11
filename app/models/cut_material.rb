class CutMaterial < ApplicationRecord
  belongs_to :cut
  belongs_to :material
  has_many :details
  has_many :individual_items
end
