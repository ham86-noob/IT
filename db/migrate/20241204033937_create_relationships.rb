class CreateRelationships < ActiveRecord::Migration[8.0]
  def change
    create_table :relationships do |t|
      t.references :following, foreign_key: { to_table: :users }
      t.references :follower, foreign_key: { to_table: :users }
      t.boolean :block, default: false

      t.timestamps
    end
  end
end
