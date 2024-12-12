# Ruby on Rails プロジェクト セットアップガイド

## 概要
このプロジェクトは、ITプロジェクト（仮）です。
学習教材を公開・閲覧できるウェブアプリサービス。

## 環境構築

### 1. Rubyのインストール
#### Rubyのバージョン

ver 8.0.0
#### インストール方法

事前に、パソコンにRubyをインストールしておく必要があります。

macOSだとhomebrewが必要です。

[https://qiita.com/techpit-jp/items/1bcd0f4106330b5b827c](https://qiita.com/techpit-jp/items/1bcd0f4106330b5b827c)

### 2. Gitのリポジトリをクローンする
#### 使用するブランチ
`design` ブランチを使用してください。

ブランチとは、バージョン管理を枝木に見立てて呼ぶ名です。

データベース作成などは、mainブランチで作業しているので、WEBデザインはdesignブランチで作業してもらいます。
#### リポジトリのクローンについて
ブランチのファイルはGitサーバーに保存されているので、ローカルで作業するには、

それを自分のパソコンにダウンロードする必要があります。

これを、リポジトリのクローンといいます。

[https://docs.github.com/ja/repositories/creating-and-managing-repositories/cloning-a-repository](https://docs.github.com/ja/repositories/creating-and-managing-repositories/cloning-a-repository)

### 3. ローカルで作業する
デザインを変更するには、基本的にこれらのフォルダを編集していきます。

* `app/views`
* `app/assets/stylesheets`
* `app/javascript`

特に、Ruby独自のerbファイルについて、勉強する必要があり、

さらにclass名の一部については、Bootstrapの機能を用いていることに注意です。

### 4. リモートレポジトリにプッシュする
作業が終了したら、ローカルレポジトリをリモートレポジトリにアップロードします。
これを、レポジトリのプッシュといいます。

## コントリビュート
* Issueを作成して、質問やバグ報告をしてください。