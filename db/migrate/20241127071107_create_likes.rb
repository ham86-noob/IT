class CreateLikes < ActiveRecord::Migration[8.0]
  def change
    create_table :likes do |t|
      t.references :article, null: false, foreign_key: true
      t.integer :user_id

      t.timestamps
    end
  end
end
