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
    @booking.listing_id = params[:listing_id]
    @booking.lister_id = Listing.find(params[:listing_id]).user_id
    @booking.buyer_id = current_user.id
    @booking.accom_fee = params[:accomFee]
    @booking.total_fee = params[:total]
    @booking.service_fee = params[:serviceFee]
    @booking.cleaning_fee = params[:cleaningFee]
    @booking.days_to_stay = params[:days]
    @listing = Listing.find(params[:listing_id])
    @booking.save

    respond_to do |format|
      format.json
    end

      # @listing = Listing.find(params[:listing_id])
      # render "new", status: :unprocessable_entity


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
