class Listing < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many_attached :photos
  has_many :bookings
  has_many :favorites

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch::Model
  pg_search_scope :global_search,
  against: %i[title description country state subtitle address],
  associated_against: {
    category: [ :name ],
    user: [ :username, :email, :name ]
  },
  using: {
    tsearch: { prefix: true } # <-- now `superman batm` will return something!
  }

  validates :no_of_rooms, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
  validates :description, length: { minimum: 150 }
  validates :price_per_night, numericality: { greater_than: 0 }
  validates :service_fee_per_night, numericality: { greater_than: 0 }
  validates :cleaning_fee_per_night, numericality: { greater_than: 0 }
  validates :title, :subtitle, :country,:state, :price_per_night, :no_of_rooms, :service_fee_per_night, :cleaning_fee_per_night, :address, :category_id, :description, presence: true
  # validate :minimum_photos

  # def mininmum_photos
  #   if photos.length < 5
  #     errors.add(:photos, "must have at least 5 photos attached")
  #   end
  # end
end
