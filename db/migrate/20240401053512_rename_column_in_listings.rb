class RenameColumnInListings < ActiveRecord::Migration[7.1]
  def change
    rename_column :listings, :location_for_geocode, :address
  end
end
