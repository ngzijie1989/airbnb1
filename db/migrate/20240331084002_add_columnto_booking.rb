class AddColumntoBooking < ActiveRecord::Migration[7.1]
  def change
    add_column :bookings, :apply_discount, :boolean, default: false
  end
end
