class Booking < ApplicationRecord
  belongs_to :listing
  belongs_to :buyer, class_name: 'User', foreign_key: 'user_id', required: true
end
