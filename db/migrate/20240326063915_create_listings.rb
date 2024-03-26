class CreateListings < ActiveRecord::Migration[7.1]
  def change
    create_table :listings do |t|
      t.string :address
      t.integer :no_of_rooms
      t.integer :price_per_night
      t.string :location_for_geocode
      t.integer :longitude
      t.integer :latitude
      t.integer :service_fee_per_night
      t.integer :cleaning_fee_per_night
      t.string :title
      t.string :subtitle
      t.references :user, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
