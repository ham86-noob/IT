class CreateArticles < ActiveRecord::Migration[8.0]
  def change
    create_table :articles do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title, null: false
      t.text :content
      t.boolean :featured, default: false
      t.integer :comments_count, default: 0
      t.string :linkurl, default: "", null: false
      t.integer :likes_count, default: 0

      t.string :image_file_name
      t.integer :image_file_size
      t.string :image_content_type

      t.timestamps
    end
  end
end
