class AddDefaulttoUsers < ActiveRecord::Migration[7.1]
  def change
    change_column_default :users, :accumulated_points, 0
  end
end
