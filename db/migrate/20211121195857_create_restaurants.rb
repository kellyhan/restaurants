class CreateRestaurants < ActiveRecord::Migration[6.0]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.text :address
      t.text :comments
      t.integer :user_id

      t.timestamps
    end
  end
end
