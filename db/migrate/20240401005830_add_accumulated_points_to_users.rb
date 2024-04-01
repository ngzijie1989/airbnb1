class AddAccumulatedPointsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :accumulated_points, :integer
  end
end
