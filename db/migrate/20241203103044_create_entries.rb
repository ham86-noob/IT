class CreateEntries < ActiveRecord::Migration[8.0]
  def change
    create_table :entries do |t|
      t.references :room, null: false
      t.references :user, null: false

      t.timestamps
    end
  end
end
