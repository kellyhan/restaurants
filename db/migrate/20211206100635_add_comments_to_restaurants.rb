class AddCommentsToRestaurants < ActiveRecord::Migration[6.0]
  def change
    add_column :restaurants, :comments, :array
  end
end
