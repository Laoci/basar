# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Cleaning up databases"
User.destroy_all
Item.destroy_all
Shop.destroy_all

puts "Creating users.."
admin = User.create!(username: "admin", email: "admin@gmail.com", password: "admin123", address: "test", admin: true)

puts "Creating shops.."
shop1 = Shop.create!(name: "shop 1", photo: "insert url", postal_code: 100001, address: "insert address", phone_number: "12345678" )
shop2 = Shop.create!(name: "shop 2", photo: "insert url", postal_code: 100002, address: "insert address", phone_number: "12345678" )
shop3 = Shop.create!(name: "shop 3", photo: "insert url", postal_code: 100003, address: "insert address", phone_number: "12345678" )

puts "Creating items..."
banana = Item.create!(name: "Banana", price: 1.25, quantity: 20, photo: "insert url", shop: shop1)
apple = Item.create!(name: "Apple", price: 0.90, quantity: 20, photo: "insert url", shop: shop1)
carrot = Item.create!(name: "Carrot", price: 1.05, quantity: 11, photo: "insert url", shop: shop1)
durian = Item.create!(name: "Durian", price: 5.50, quantity: 21, photo: "insert url", shop: shop1)
egg = Item.create!(name: "Egg", price: 3.10, quantity: 3, photo: "insert url", shop: shop1)

puts "Done seeding!"
