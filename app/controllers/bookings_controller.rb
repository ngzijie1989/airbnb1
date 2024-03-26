class BookingsController < ApplicationController
  def index
    @bookings = policy_scope(Booking)
  end

  def new
    @booking = Booking.new(booking_params)
    @listing = Listing.find(params[:listing_id])

    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params2)
    @booking.aproval_status = "pending"
    @booking.listing_id = params[:listing_id]
    @booking.lister_id = Listing.find(params[:listing_id]).user_id
    @booking.buyer_id = current_user.id
    @booking.save!

    redirect_to bookings_path

    authorize @booking
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :no_of_guests)
  end

  def booking_params2
    params.require(:booking).permit(:start_date, :end_date, :no_of_guests, :payment)
  end
end
