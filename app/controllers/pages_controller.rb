class PagesController < ApplicationController
  def home
  end

  def account_info
    @user = current_user
  end

  def dashboard
    @user = current_user

    @pending_bookings = Booking.where(lister_id: current_user.id, aproval_status: "pending").includes(:listing)
    # @pending_bookings_listings_id = @pending_bookings.map do |single| single.listing_id end

    @approved_bookings = Booking.where(lister_id: current_user.id, aproval_status: "approved").includes(:listing)
    # @approved_bookings_listings_id = @approved_bookings.map do |single| single.listing_id end

    @listings = Listing.where(user: @user).includes(photos_attachments: :blob)
    # @pending_bookings_listings = Listing.where(id: @pending_bookings_listings_id)
    # @approved_bookings_listings = Listing.where(id: @approved_bookings_listings_id)
  end
end
