class Employee < ApplicationRecord
  belongs_to :role
  enum status: [:active, :blocked]
  validates :password, format: {without: /\p{Cyrillic}+/, message: 'Без кириллицы'}
end
