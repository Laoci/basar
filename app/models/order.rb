class Order < ApplicationRecord
  belongs_to :user
  has_many :items, through: :item_orders

  monetize :amount_cents
end
