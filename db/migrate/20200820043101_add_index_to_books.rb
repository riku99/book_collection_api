class AddIndexToBooks < ActiveRecord::Migration[6.0]
  def change
    add_index :books, [:user_id, :created_at]
    add_foreign_key :books, :users, column: :user_id
  end
end
