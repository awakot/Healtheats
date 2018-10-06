class CreateMenus < ActiveRecord::Migration[5.2]
  def change
    create_table :menus do |t|
      t.string :description
      t.integer :price
      t.string :picture
      t.integer :calorie_id

      t.timestamps
    end
  end
end
