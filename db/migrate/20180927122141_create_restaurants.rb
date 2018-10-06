class CreateRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants do |t|
      t.integer :zip_code
      t.string :address
      t.string :name
      t.geometry :latitude
      t.geometry :longitude

      t.timestamps
    end
  end
end
