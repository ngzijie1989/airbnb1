class Booking < ApplicationRecord
  belongs_to :listing
  belongs_to :buyer, class_name: "User", foreign_key: 'buyer_id', required: true
  belongs_to :lister, class_name: "User", foreign_key: 'lister_id', required: true

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :no_of_guests, presence: true
  validates :payment, presence: true
  # validates :no_overlap_bookings, presence: true

  private

  def no_overlap_bookings
    if listing && Booking.where(listing_id: listing_id)
      .where.not(id: id) # Exclude current booking if it exists
      .where("start_date <= ? AND end_date >= ?", end_date, start_date)
      .exists?
    errors.add(:base, "Booking overlaps with existing booking")
    end
  end
end
