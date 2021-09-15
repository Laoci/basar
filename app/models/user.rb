class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :reviews
  has_many :orders
  validates :username, presence: true, length: { minimum: 3 }
  validates :email, presence: true, format: { with: /[a-z0-9._]{3,}@[a-z0-9.]{5,}/ }
end
