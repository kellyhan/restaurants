class CreateDishes < ActiveRecord::Migration[6.0]
  def change
    create_table :dishes do |t|
      t.string :name
      t.string :image
      t.integer :restaurant_id
      t.text :comments

      t.timestamps
    end
  end
end
