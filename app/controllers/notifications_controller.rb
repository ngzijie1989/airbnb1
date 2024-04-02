class NotificationsController < ApplicationController
  def index
    @notifications = policy_scope(Notification)
  end

  def show
    @notification = Notification.find(params[:id])
    @notification.read = true
    @notification.save
    @booking = Booking.find(@notification.booking_id)

    redirect_to booking_review_path(@booking)

    authorize @notification
  end
end
