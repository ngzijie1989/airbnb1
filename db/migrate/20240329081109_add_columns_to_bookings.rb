class AddColumnsToBookings < ActiveRecord::Migration[7.1]
  def change
    add_column :bookings, :total_fee, :integer
    add_column :bookings, :cleaning_fee, :integer
    add_column :bookings, :days_to_stay, :integer
    add_column :bookings, :service_fee, :integer
  end
end
