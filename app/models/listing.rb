class Listing < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many_attached :photos
  has_many :bookings

  include PgSearch::Model
  pg_search_scope :global_search,
  against: %i[title description country state subtitle],
  associated_against: {
    category: [ :name ],
    user: [ :username, :email, :name ]
  },
  using: {
    tsearch: { prefix: true } # <-- now `superman batm` will return something!
  }
end
