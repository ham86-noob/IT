class AddUuidToArticles < ActiveRecord::Migration[8.0]
  def change
    add_column :articles, :uuid, :string
    add_index :articles, :uuid, unique: true
    add_column :users, :uuid, :string
    add_index :users, :uuid, unique: true
    add_column :rooms, :uuid, :string
    add_index :rooms, :uuid, unique: true 
  end
end
