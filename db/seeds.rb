# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts "Cleaning up databases"
User.destroy_all
Item.destroy_all
Shop.destroy_all

puts "Creating users.."
admin = User.create!(username: "admin", email: "admin@gmail.com", password: "admin123", address: "test", admin: true)

puts "Creating 30 shops.."
30.times do
  shop_name = Faker::Restaurant.name
  shop_photo = "insert url",
  postal_code = Faker::Number.number(digits: 6)
  address = Faker::Address.street_name
  phone_number = Faker::Number.number(digits: 8)

  shop = Shop.new(name: shop_name, photo: shop_photo, postal_code: postal_code, address: address, phone_number: phone_number)
  shop.save!

  rand(10..20).times do
    food = Faker::Food.vegetables
    price = Faker::Number.between(from: 60, to: 1000)
    photo = "insert url"
    quantity = Faker::Number.between(from: 50, to: 300)
    item = Item.new(name: food, price_cents: price, quantity: quantity, photo: photo, shop: shop)

    item.save!
  end
end
# shop1 = Shop.create!(name: "shop 1", photo: "insert url", postal_code: 100001, address: "insert address", phone_number: "12345678" )
# shop2 = Shop.create!(name: "shop 2", photo: "insert url", postal_code: 100002, address: "insert address", phone_number: "12345678" )
# shop3 = Shop.create!(name: "shop 3", photo: "insert url", postal_code: 100003, address: "insert address", phone_number: "12345678" )

# puts "Creating items..."

# banana = Item.create!(name: "Banana", price_cents: 125, quantity: 3, photo: "insert url", shop: shop1)
# apple = Item.create!(name: "Apple", price_cents: 90, quantity: 3, photo: "insert url", shop: shop1)
# carrot = Item.create!(name: "Carrot", price_cents: 105, quantity: 3, photo: "insert url", shop: shop2)
# durian = Item.create!(name: "Durian", price_cents: 550, quantity: 3, photo: "insert url", shop: shop2)
# egg = Item.create!(name: "Egg", price_cents: 325, quantity: 3, photo: "insert url", shop: shop3)
# pear = Item.create!(name: "Pear", price_cents: 150, quantity: 3, photo: "insert url", shop: shop3)

puts "Done seeding!"
