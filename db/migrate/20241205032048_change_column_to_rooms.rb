class ChangeColumnToRooms < ActiveRecord::Migration[8.0]
  def change
    remove_column :rooms, :name, :string
    add_column :rooms, :user_id1, :integer, null: false
    add_column :rooms, :user_id2, :integer, null: false
    add_index :rooms, [:user_id1, :user_id2], unique: true
  end
end
