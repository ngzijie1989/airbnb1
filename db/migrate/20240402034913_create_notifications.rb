class CreateNotifications < ActiveRecord::Migration[7.1]
  def change
    create_table :notifications do |t|
      t.references :user, null: false, foreign_key: true
      t.text :message
      t.boolean :read
      t.boolean :soft_delete
      t.string :link

      t.timestamps
    end
  end
end
