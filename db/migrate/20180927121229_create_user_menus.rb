class CreateUserMenus < ActiveRecord::Migration[5.2]
  def change
    create_table :user_menus do |t|
      t.int :user_id
      t.int :menu_id

      t.timestamps
    end
  end
end
