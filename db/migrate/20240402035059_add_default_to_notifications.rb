class AddDefaultToNotifications < ActiveRecord::Migration[7.1]
  def change
    change_column :notifications, :soft_delete, :boolean, :default => false
    change_column :notifications, :read, :boolean, :default => false
  end
end
