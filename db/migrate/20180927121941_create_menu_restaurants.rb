class CreateMenuRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :menu_restaurants do |t|
      t.integer :menu_id
      t.integer :restaurant_id

      t.timestamps
    end
  end
end