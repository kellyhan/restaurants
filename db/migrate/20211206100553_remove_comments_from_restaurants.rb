class RemoveCommentsFromRestaurants < ActiveRecord::Migration[6.0]
  def change
    remove_column :restaurants, :restaurant_comments
  end
end
