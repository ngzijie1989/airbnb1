class RenameColumnToListerId < ActiveRecord::Migration[7.1]
  def change
    rename_column :bookings, :user_id, :buyer_id
    add_reference :bookings, :lister, foreign_key: { to_table: :users }
  end
end
