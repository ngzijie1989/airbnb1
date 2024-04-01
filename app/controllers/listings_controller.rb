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

  def new
    @listing = Listing.new

    authorize @listing
  end

  def create
    @listing = Listing.new(listing_params)
    @listing.user_id = current_user.id

    if @listing.save
      redirect_to dashboard_path
      flash[:success]  = "Listing created successfully"
    else
      render "new", status: :unprocessable_entity
    end

    authorize @listing
  end

  def show
    @listing = Listing.find(params[:id])
    @booking = Booking.new

    @markers = [{ lat: @listing.latitude,
               lng: @listing.longitude}]

    authorize @listing
  end

  def destroy
    @listing = Listing.find(params[:id])
    @listing.destroy

    respond_to do |format|
      format.json {render json: {status: "deleted"}}
    end

    authorize @listing
  end

  def bookedlistingshow
    @listing = Listing.find(params[:id])
    @booking = Booking.find(params[:booking_id])

    @markers = [{ lat: @listing.latitude,
    lng: @listing.longitude}]
    
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

  def viewing
    @listing = Listing.find(params[:listing_id])

    authorize @listing
  end

  private

  def listing_params
    params.require(:listing).permit(:country, :no_of_rooms, :price_per_night, :address, :service_fee_per_night, :cleaning_fee_per_night, :title, :subtitle, :category_id, :state, :description, photos: [])
  end
end
