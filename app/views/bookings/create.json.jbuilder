json.status @booking.valid?
json.info render(partial: 'newbooking', locals: {booking: @booking, listing: @listing}, formats: [:html])