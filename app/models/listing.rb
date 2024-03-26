class Listing < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many_attached :photos
  has_many :bookings
end
