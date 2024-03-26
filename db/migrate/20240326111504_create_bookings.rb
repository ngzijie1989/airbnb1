class CreateBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :bookings do |t|
      t.date :start_date
      t.date :end_date
      t.references :listing, null: false, foreign_key: true
      t.string :aproval_status
      t.integer :no_of_guests
      t.references :user, null: false, foreign_key: true, as 

      t.timestamps
    end
  end
end
