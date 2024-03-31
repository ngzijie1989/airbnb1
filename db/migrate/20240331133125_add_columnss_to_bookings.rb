class AddColumnssToBookings < ActiveRecord::Migration[7.1]
  def change
    rename_column :bookings, :discount_applied, :points_used
    add_column :bookings, :discounted_total, :integer
    add_column :bookings, :discount, :integer
  end
end
