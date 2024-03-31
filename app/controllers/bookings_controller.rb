class BookingsController < ApplicationController
  def index
    @bookings = policy_scope(Booking)
    
  end

  def new
    @booking = Booking.new
    @listing = Listing.find(params[:listing_id])
    @user = current_user
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
    @user = current_user

    if params[:booking][:apply_discount] == "1"
      @booking.apply_discount = true
      @booking.discount = params[:discount]
      @booking.discounted_total = params[:discountedTotal]
      @redemption = Redemption.new
      @redemption.points_redeemed = params[:booking][:points_used]
      @redemption.user_id = @user.id
      @redemption.discount_applied = params[:discount]

    else 
      @booking.apply_discount = false
      @booking.discount = nil
      @booking.discounted_total = nil
    end

    if @booking.save && params[:booking][:apply_discount] == "1"
      @redemption.booking_id = @booking.id
      @redemption.save
    end

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

  def reviewbooking
    @booking = Booking.find(params[:booking_id])
    @listing = Listing.find(@booking.listing_id)

    authorize @booking
  end

  def approve
    @booking = Booking.find(params[:booking_id])
    @booking.aproval_status = "approved"
    @booking.save
    @user = User.find(@booking.buyer_id)
    @days = @booking.days_to_stay
    @user.approve_add_points(@days)
    @user.save

    respond_to do |format|
      format.json {render json: {status: "ok"}}
    end

    authorize @booking
  end

  def reject
    @booking = Booking.find(params[:booking_id])
    @booking.aproval_status = "rejected"
    @booking.save

    respond_to do |format|
      format.json {render json: {status: "ok"}}
    end

    authorize @booking
  end

  private

  def booking_params2
    params.require(:booking).permit(:start_date, :end_date, :no_of_guests, :payment, :listing_id)
  end
end
