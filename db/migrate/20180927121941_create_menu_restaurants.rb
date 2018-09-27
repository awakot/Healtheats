class CreateMenuRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :menu_restaurants do |t|
      t.int :menu_id
      t.int :restaurant_id

      t.timestamps
    end
  end
end
