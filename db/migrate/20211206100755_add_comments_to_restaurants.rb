class AddCommentsToRestaurants < ActiveRecord::Migration[6.0]
  def change
    add_column :restaurants, :restaurant_comments, :text
  end
end
