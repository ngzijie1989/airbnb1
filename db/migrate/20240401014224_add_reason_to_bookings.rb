class AddReasonToBookings < ActiveRecord::Migration[7.1]
  def change
    add_column :bookings, :reject_reason, :text
  end
end
