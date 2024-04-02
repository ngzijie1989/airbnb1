class AddReferenceToNotifications < ActiveRecord::Migration[7.1]
  def change
    add_reference :notifications, :listing, foreign_key: true
  end
end
