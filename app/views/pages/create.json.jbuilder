json.status "unauthorized"
json.info render(partial: 'newbooking', locals: {booking: @booking, listing: @listing, user: @user}, formats: [:html])