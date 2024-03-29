class ChangeColumnInBookings < ActiveRecord::Migration[7.1]
  def change
    rename_column :bookings, :total_price, :accom_fee
  end
end
