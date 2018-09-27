class CreateMenuTags < ActiveRecord::Migration[5.2]
  def change
    create_table :menu_tags do |t|
      t.int :menu_id
      t.int :tag_id

      t.timestamps
    end
  end
end
