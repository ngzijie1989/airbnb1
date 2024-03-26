require 'faker'

# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "deleting all entries"
Booking.destroy_all
Listing.destroy_all
Category.destroy_all
User.destroy_all

puts "creating entries"
user1 = User.create!(email: "user1@hotmail.com", username: "user1", password: "123456", bio: "Nice to meet you", name: "user1zi")
user2 = User.create!(email: "user2@hotmail.com", username: "user2", password: "123456", bio: "Nice to meet you!!", name: "user2zi")
user3 = User.create!(email: "user3@hotmail.com", username: "user3", password: "123456", bio: "bangawan solo", name: "user3zi")
user4 = User.create!(email: "user4@hotmail.com", username: "user4", password: "123456", bio: "Nice to meet you!!", name: "user4zi")

cat1 = Category.create!(name: "HDB")
cat2 = Category.create!(name: "Condo")
cat3 = Category.create!(name: "Service Apartment")
cat4 = Category.create!(name: "Landed")
cat5 = Category.create!(name: "Villa")

20.times do |index|
cat_array = [cat1, cat2, cat3, cat4, cat5]
user_array = [user1, user2, user3, user4]
Listing.create!(country: Faker::Address.country, 
                state: Faker::Address.city, 
                no_of_rooms: rand(1..5), 
                description: 
                "Discover the perfect blend of comfort and style in our spacious Airbnb apartment. Located in the heart of the city, 
                this cozy retreat offers modern amenities, breathtaking views, and easy access to top attractions. Unwind in the luxurious
                 living space, savor gourmet meals in the fully-equipped kitchen, and recharge in the serene bedroom. Your ideal urban getaway
                  awaits!",
                category_id: cat_array.sample.id, 
                price_per_night: 150, 
                location_for_geocode: Faker::Address.full_address, 
                service_fee_per_night: 30, 
                cleaning_fee_per_night: 15, 
                title: Faker::Quote.famous_last_words, 
                subtitle: Faker::Markdown.emphasis, 
                user_id: user_array.sample.id)
end

puts "seeds done"