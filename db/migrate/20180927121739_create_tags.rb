class CreateTags < ActiveRecord::Migration[5.2]
  def change
    create_table :tags do |t|
      t.varchar :name

      t.timestamps
    end
  end
end
