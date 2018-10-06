class CreateMenus < ActiveRecord::Migration[5.2]
  def change
    create_table :menus do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.integer :price, null: false
      t.string :picture, null: false
      t.references :calorie, foreign_key: true
      t.references :restaurant, foreign_key: true
      # t.references :category, foreign_key: true
      # t.references :tag, foreign_key: true

      t.timestamps
    end
  end
end
