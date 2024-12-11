class CreateSubcategories < ActiveRecord::Migration[8.0]
  def change
    create_table :subcategories do |t|
      t.references :category, foreign_key: true
      t.string :name, null: false

      t.timestamps
    end
  end
end
