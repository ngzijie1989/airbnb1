class AddMessageHeaderToNotifications < ActiveRecord::Migration[7.1]
  def change
    add_column :notifications, :message_header, :string
  end
end
