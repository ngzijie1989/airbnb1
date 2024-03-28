class FavoritesController < ApplicationController

  def index
    @favorites = policy_scope(Favorite)
    @fav_ids = @favorites.map do |fav| fav.listing_id end
    @listings = Listing.where(id: @fav_ids)
  end
end
