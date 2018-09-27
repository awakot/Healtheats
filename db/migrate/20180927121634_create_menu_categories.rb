class CreateMenuCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :menu_categories do |t|
      t.int :menu_id
      t.int :category_id

      t.timestamps
    end
  end
end
