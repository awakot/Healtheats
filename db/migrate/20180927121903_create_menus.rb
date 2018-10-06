class CreateMenus < ActiveRecord::Migration[5.2]
  def change
    create_table :menus do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.integer :price, null: false
      t.string :picture, null: false
      t.integer :calorie_id, null: false

      t.timestamps
    end
  end
end
