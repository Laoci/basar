class Shop < ApplicationRecord
  has_many :orders, :items, :reviews
  has_one :photo
  # Name of shop, must only have 1 shop name and minimum shop name
  validates :name, presence: true, length: { minimum: 3 }

  # Postal code must be present, have 6 numbers, must be numbers else error
  validates :postal_code, presence: true, length: { minimum: 6 }, numericality: { only_integer: true }

  # Address must be present, have at least 8 letters
  validates :address, presence: true, length: { minimum: 8 }

  # Phone number must be present, have 8 numbers, must be numbers else error
  validates :phone_number, presence: true, length: { minimum: 8 }, numericality: { only_integer: true }

  # Photo must be present
  validates :photo, presence: true
end
