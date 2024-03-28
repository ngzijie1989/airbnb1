class BookingsController < ApplicationController
  def index
    @bookings = policy_scope(Booking)
    
  end

  def new
    @booking = Booking.new
    @listing = Listing.find(params[:listing_id])
    authorize @booking
  end

  def show
    @booking = Booking.find(params[:id])
    @listing = Listing.find(@booking.listing_id)

    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params2)
    @booking.aproval_status = "pending"
    @booking.listing_id = booking_params2[:listing_id]
    @booking.lister_id = Listing.find(booking_params2[:listing_id]).user_id
    @booking.buyer_id = current_user.id
    
    if @booking.save
      redirect_to bookings_path
    else
      @listing = Listing.find(params[:listing_id])
      render "new", status: :unprocessable_entity
    end

    authorize @booking
  end

  def sendreminder
    @booking = Booking.find(params[:booking_id])

    authorize @booking
  end

  private

  def booking_params2
    params.require(:booking).permit(:start_date, :end_date, :no_of_guests, :payment, :listing_id)
  end
end
