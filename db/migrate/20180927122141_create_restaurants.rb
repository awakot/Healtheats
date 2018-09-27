class CreateRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants do |t|
      t.int :zip_code
      t.varchar :address
      t.varchar :name
      t.geometry :latitude
      t.geometry :longitude

      t.timestamps
    end
  end
end
