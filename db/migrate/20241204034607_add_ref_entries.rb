class AddRefEntries < ActiveRecord::Migration[8.0]
  def change
    # add_reference :users, :article, foreign_key: true
    # # 外部キーの削除はこちら
    # remove_foreign_key :users, column: :article_id
    # # カラムも一緒に削除する場合はこちら
    # remove_reference :users, :article, foreign_key: true

    add_foreign_key :entries, :rooms
    add_foreign_key :entries, :users
    add_foreign_key :messages, :rooms
    add_foreign_key :messages, :users
  end
end
