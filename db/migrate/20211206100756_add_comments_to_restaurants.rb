class AddCommentsToRestaurants < ActiveRecord::Migration[6.0]
  def change
    add_column :restaurants, :comment_id, :integer
  end
end
