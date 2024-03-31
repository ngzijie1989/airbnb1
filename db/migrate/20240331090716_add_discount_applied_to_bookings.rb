class AddDiscountAppliedToBookings < ActiveRecord::Migration[7.1]
  def change
    add_column :bookings, :discount_applied, :integer
  end
end
