class ListingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @listings = policy_scope(Listing)

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
end
