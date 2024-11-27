class CreateArticles < ActiveRecord::Migration[8.0]
  def change
    create_table :articles do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title, null: false
      t.text :content
      t.boolean :featured, default: false
      t.integer :comments_count, default: 0

      t.timestamps
    end
  end
end
