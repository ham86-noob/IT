class CreateMessages < ActiveRecord::Migration[8.0]
  def change
    create_table :messages do |t|
      t.references :user, null: false
      t.references :room, null: false
      t.text :content, null: false

      t.timestamps
    end
  end
end
