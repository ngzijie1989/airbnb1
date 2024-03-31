json.status @booking.valid?
json.info render(partial: 'newbooking', locals: {booking: @booking, listing: @listing, user: @user}, formats: [:html])