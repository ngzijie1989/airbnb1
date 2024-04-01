class AddCancelReasonToBooking < ActiveRecord::Migration[7.1]
  def change
    add_column :bookings, :cancel_reason, :string
  end
end
