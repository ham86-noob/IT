class CreateNotifications < ActiveRecord::Migration[8.0]
  def change
    create_table :notifications do |t|
      t.references :recipient, null: false, foreign_key: { to_table: :users }
      t.references :actor, foreign_key: { to_table: :users }
      t.references :notifiable, polymorphic: true, null: false
      t.string :action, null: false
      t.boolean :read, default: false, null: false

      # recipient: 通知を受け取るユーザー（Userモデルへの関連）。
      # actor: アクションを起こしたユーザー（例: 投稿を「いいね」したユーザー）。
      # notifiable: 通知の対象となるモデル（例: ArticleやCommentなど、ポリモーフィック関連）。
      # action: 通知の内容を簡潔に表す文字列（例: "liked", "commented", "followed" など）。
      # read: 通知が既読かどうかを管理するフラグ。

      t.timestamps
    end
  end
end
