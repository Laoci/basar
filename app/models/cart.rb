class Cart < ApplicationRecord
  has_many :items
  belong_to :user
end
