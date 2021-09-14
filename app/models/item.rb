class Item < ApplicationRecord
  # for name, it must be unique, it cannot be empty and minimum length is 3 char.
  validates :name, presence: true, length: { minimum: 3 }
  validates :name, uniqueness: true

  # for price, it cannot be empty and it must be numbers and greater than 0.
  validates :price, presence: true
  validates :price, numericality: true
  validates :price, numericality: { greater_than: 0 }

  # for quantity, cannot be empty, it must be a number but can accept 0
  validates :quantity, presence: true
  validates :quantity, numericality: { only_integer: true }
  validates :quantity, numericality: { greater_than_or_equal_to: 0 }

  # for photo, cannot be empty
  validates :photo, presence: true
end
