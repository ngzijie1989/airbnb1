class Booking < ApplicationRecord
  belongs_to :listing
  belongs_to :buyer, class_name: "User", foreign_key: 'buyer_id', required: true
  belongs_to :lister, class_name: "User", foreign_key: 'lister_id', required: true
end
