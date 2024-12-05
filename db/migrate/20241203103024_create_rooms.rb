class CreateRooms < ActiveRecord::Migration[8.0]
  def change
    create_table :rooms do |t|
      t.integer :user_id1, null: false
      t.integer :user_id2, null: false

      t.timestamps
    end

    add_index :rooms, [:user_id1, :user_id2], unique: true
  end
end
