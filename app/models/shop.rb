class Shop < ApplicationRecord

  has_many :items, :reviews
  has_many :orders, through: :items

  has_many :items
  has_many :reviews
  has_many :item_orders, through: :items

  # Name of shop, must only have 1 shop name and minimum shop name
  validates :name, presence: true, length: { minimum: 3 }

  # Postal code must be present, have 6 numbers, must be numbers else error
  validates :postal_code, presence: true, length: { is: 6 }, numericality: { only_integer: true }

  # Address must be present, have at least 8 letters
  validates :address, presence: true, length: { minimum: 8 }

  # Phone number must be present, have 8 numbers, must be numbers else error
  validates :phone_number, presence: true, length: { is: 8 }, numericality: { only_integer: true }

  # Photo must be present
  validates :photo, presence: true
end
