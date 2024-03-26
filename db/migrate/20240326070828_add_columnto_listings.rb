class AddColumntoListings < ActiveRecord::Migration[7.1]
  def change
    add_column :listings, :state, :string
    rename_column :listings, :address, :country
  end
end
