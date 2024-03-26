class AddColumnsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :username, :string
    add_column :users, :bio, :string
    add_column :users, :name, :string
    add_column :users, :points, :integer, default: 0
  end
end
