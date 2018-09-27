class CreateMenus < ActiveRecord::Migration[5.2]
  def change
    create_table :menus do |t|
      t.varchar :description
      t.int :price
      t.varchar :picture
      t.int :calorie_id

      t.timestamps
    end
  end
end
