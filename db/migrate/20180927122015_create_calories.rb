class CreateCalories < ActiveRecord::Migration[5.2]
  def change
    create_table :calories do |t|
      t.integer :amount

      t.timestamps
    end
  end
end
