class Review < ApplicationRecord
  belongs_to :shop
  belongs_to :user

  validates :rating, presence: true
  validates :rating, numericality: { only_integer: true }
  validates :rating, numericality: { greater_than: 0, less_than_or_equal_to: 5 }
end
