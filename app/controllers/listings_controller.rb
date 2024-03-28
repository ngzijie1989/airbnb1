class ListingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @listings = policy_scope(Listing)
    @favorites = Favorite.all

    if params[:query].present?
      @listings = Listing.global_search(params[:query])
    else 
      @listings
    end
  end

  def show
    @listing = Listing.find(params[:id])
    @booking = Booking.new
    authorize @listing
  end

  def bookedlistingshow
    @listing = Listing.find(params[:id])
    @booking = Booking.find(params[:booking_id])
    authorize @listing
  end

  def addfavorites
    @listing = Listing.find(params[:listing_id])
    listing_id = params[:listing_id]
    user_id = current_user.id

    fav_check = Favorite.all.find_by(listing_id: listing_id, user_id: user_id)

    if fav_check.nil?
      new_fav = Favorite.new
      new_fav.listing_id = listing_id
      new_fav.user_id = user_id
      new_fav.save!
    else
      fav_check.destroy
    end

    respond_to do |format|
      format.json { render json: {status: fav_check.nil?} }
    end
    authorize @listing
  end
end
