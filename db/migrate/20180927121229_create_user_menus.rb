class CreateUserMenus < ActiveRecord::Migration[5.2]
  def change
    create_table :user_menus do |t|
      t.integer :user_id
      t.integer :menu_id

      t.timestamps
    end
  end
end
