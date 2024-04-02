class AddBookingIDtoNotifications < ActiveRecord::Migration[7.1]
  def change
    add_column :notifications, :type, :string
    add_reference :notifications, :booking, foreign_key: true
  end
end
