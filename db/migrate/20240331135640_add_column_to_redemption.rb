class AddColumnToRedemption < ActiveRecord::Migration[7.1]
  def change
    rename_column :redemptions, :points_to_redeem, :points_redeemed
    add_column :redemptions, :discount_applied, :integer
  end
end
