class NotificationsController < ApplicationController
  def index
    @notifications = policy_scope(Notification)
  end

  def show
    @notification = Notification.find(params[:id])
    @notification.update(read: true)
    @booking = Booking.find(@notification.booking_id)

    if @notification.notification_type == "new booking"
      redirect_to booking_review_path(@booking)
    elsif "booking"
      redirect_to booking_path(@booking)
    else
      redirect_to root_path
      flash[:alert] = "Error"
    end

    authorize @notification
  end
end
