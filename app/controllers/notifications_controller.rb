class NotificationsController < ApplicationController
  def index
    @notifications = policy_scope(Notification)
  end

  def show
    @notification = Notification.find(params[:id])
    @notification.update(read: true)
    @booking = Booking.find(@notification.booking_id)

    case @notification.notification_type
    
    when "new booking"
      redirect_to booking_review_path(@booking)
    
    when "booking"
      redirect_to booking_path(@booking)
    else
      redirect_to root_path
      flash[:alert] = "Error"
    end

    authorize @notification
  end
end
