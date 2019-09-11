class Client < ApplicationRecord
  attr_accessor :eula

  devise :database_authenticatable, :registerable, :rememberable, :trackable, :validatable

  has_many :details
  has_many :individual_items
  has_many :individual_orders

  validates :email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  validates :phone_number, presence: true, format: { with: /\A\d{8,9}\z/ }
  validates :eula, acceptance: {accept: 'accept'}, allow_nil: false, on: :create
  validates :password, format: {without: /\p{Cyrillic}+/, message: 'Без кириллицы'}

  enum person_type: [:individual, :legal]

  def self.session_cart_items(cart_session_id)
    return IndividualItem.none unless cart_session_id.present?
    IndividualItem.where(client_id: nil, cart_session_id: cart_session_id).in_cart.order(created_at: :asc)
  end

  def cart_items
    individual_items.in_cart.order(created_at: :asc)
  end

  def generate_confirmation_token!
    code = rand(100_000..999_999)
    self.update_column(:confirmation_token, code)
  end

  def confirm!
    self.update_column(:confirmation_token, nil)
  end

  def unconfirmed?
    confirmation_token.present?
  end

  def generate_sms_code!
    code = rand(100_000..999_999)
    self.update_column(:reset_password_token, code)
  end

  def generate_password_token!
    self.update_column(:reset_password_token, Devise.friendly_token)
  end
end
