class Listing < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many_attached :photos
  has_many :bookings

  include PgSearch::Model
  pg_search_scope :search_by_title_and_country_and_state_and_subtitle_and_category_and_description,
  against: [ :country, :title, :subtitle, :state, :category, :description ],
  using: {
    tsearch: { prefix: true } # <-- now `superman batm` will return something!
  }
end
