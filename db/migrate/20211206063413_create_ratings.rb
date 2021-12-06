class CreateRatings < ActiveRecord::Migration[6.0]
  def change
    create_table :ratings do |t|
      t.integer :rate
      t.integer :user_id
      t.integer :restaurant_id

      t.timestamps
    end
  end
end
