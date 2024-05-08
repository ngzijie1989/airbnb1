require 'faker'
require 'open-uri'

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
Notification.destroy_all
Redemption.destroy_all
Booking.destroy_all
Favorite.destroy_all
Listing.destroy_all
Category.destroy_all
User.destroy_all

puts "creating entries"
user1 = User.create!(email: "user1@hotmail.com", username: "Zi Jie", password: "123456", bio: "Nice to meet you", name: "Zi Jie")
user2 = User.create!(email: "user2@hotmail.com", username: "Charlie Soh", password: "123456", bio: "Nice to meet you!!", name: "Charlie Soh")
user3 = User.create!(email: "user3@hotmail.com", username: "Jeremy Bannar", password: "123456", bio: "bangawan solo", name: "Jeremy Bannar")
user4 = User.create!(email: "user4@hotmail.com", username: "Magnus Mitbo", password: "123456", bio: "Nice to meet you!!", name: "Magnus Mitbo")

file1 = URI.open("https://thispersondoesnotexist.com/")
user1.photo.attach(io: file1, filename: "avatar1.jpeg", content_type: "image/jpeg")
user1.save

file2 = URI.open("https://thispersondoesnotexist.com/")
user2.photo.attach(io: file2, filename: "avatar1.jpeg", content_type: "image/jpeg")
user2.save

file3 = URI.open("https://thispersondoesnotexist.com/")
user3.photo.attach(io: file3, filename: "avatar1.jpeg", content_type: "image/jpeg")
user3.save

file4 = URI.open("https://thispersondoesnotexist.com/")
user4.photo.attach(io: file4, filename: "avatar1.jpeg", content_type: "image/jpeg")
user4.save

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
                Faker::Lorem.paragraph_by_chars(number: 250, supplemental: false),
                category_id: cat_array.sample.id, 
                price_per_night: 150, 
                address: Faker::Address.full_address, 
                service_fee_per_night: 30, 
                cleaning_fee_per_night: 15, 
                title: Faker::Quote.famous_last_words, 
                subtitle: Faker::Markdown.emphasis, 
                user_id: user_array.sample.id)
end

puts "seeds done"