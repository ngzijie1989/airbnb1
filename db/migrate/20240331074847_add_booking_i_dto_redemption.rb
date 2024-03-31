class AddBookingIDtoRedemption < ActiveRecord::Migration[7.1]
  def change
    add_reference :redemptions, :booking, foreign_key: true
  end
end
