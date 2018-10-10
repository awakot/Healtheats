class CreateMenuTags < ActiveRecord::Migration[5.2]
  def change
    create_table :menu_tags do |t|
      t.integer :menu_id, null: false
      t.integer :tag_id, null: false

      t.timestamps
    end
  end
end
