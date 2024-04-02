class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :listings, dependent: :destroy
  has_one_attached :photo
  has_many :favorites, dependent: :destroy
  has_many :redemptions, dependent: :destroy
  has_many :bookings_as_buyer, class_name: 'Booking', foreign_key: 'buyer_id'
  has_many :bookings_as_lister, class_name: 'Booking', foreign_key: 'lister_id'
  has_many :notifications, dependent: :destroy

  def approve_add_points(days)
    self.points += days * 500
    self.accumulated_points += days * 500
  end

  validates :points, numericality: { greater_than_or_equal_to: 0 }
  validates :accumulated_points, numericality: { greater_than_or_equal_to: 0 }
end
