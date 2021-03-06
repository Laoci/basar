class Item < ApplicationRecord
  has_many :item_orders
  has_many :orders, through: :item_orders
  belongs_to :shop

  # for name, it must be unique, it cannot be empty and minimum length is 3 char.
  validates :name, presence: true, length: { minimum: 3 }
  validates :name, uniqueness: false

  # for price, it cannot be empty and it must be numbers and greater than 0.
  monetize :price_cents
  validates :price_cents, presence: true
  validates :price_cents, numericality: true
  validates :price_cents, numericality: { greater_than: 0 }

  # for quantity, cannot be empty, it must be a number but can accept 0
  validates :quantity, presence: true
  validates :quantity, numericality: { only_integer: true }
  validates :quantity, numericality: { greater_than_or_equal_to: 0 }

  # for photo, cannot be empty
  validates :photo, presence: true
end
