class AddIndexToUsersEmail < ActiveRecord::Migration[5.2]
  def up
      add_index :users, :email, unique: true
  end

  def down
      remove_index :users, :email, unique: true
  end
end
