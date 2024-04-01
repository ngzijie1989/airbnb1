class ChangeTypeInListings < ActiveRecord::Migration[7.1]
  def change
    change_column :listings, :longitude, :float
    change_column :listings, :latitude, :float
  end
end
