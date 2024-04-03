class Notification < ApplicationRecord
  belongs_to :user
  belongs_to :booking, optional: true
  belongs_to :listing, optional: true

  def notification_header(message)
    case message
    when "new booking"
      "New Booking. Please review the booking"
    when "approve booking"
      "Your booking has been approved"
    when "reject booking"
      "Your booking has been rejected"
    else
      "Unknown notification"
    end
  end
end
