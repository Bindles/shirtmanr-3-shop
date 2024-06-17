# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Seed data for products
# Product.destroy_all

6.times do |i|
  product = Product.create!(
    name: "T-shirt #{i+1}",
    category: 'T-shirt',
    price: 2999,
    description: "Made from soft, breathable cotton, these shirts offer the perfect blend of comfort and durability. Available in a variety of colors and designs, they are perfect for any occasion."
    # You can leave the 'img' attribute blank as per your requirement
  )

  puts "Product '#{product.name}' created!"
end
