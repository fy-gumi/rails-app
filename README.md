# README

## 環境構築手順

下記コマンドを実行していく

```
git clone git@github.com:fy-gumi/rails-app.git

cd rails-app

docker-compose run web rails new . --force --no-deps --database=mysql --webpacker

docker-compose run web rake db:create

docker-compose up -d --build

docker-compose run web rails db:migrate
```

## 内容
FPが予約枠を作成しユーザが予約するシステムです。

## 注意点
- 不要なファイルや処理がかなりたくさん残っているため、想定していない挙動をする可能性があります。

## 今後やること
- 予約画面のUIを修正
    - 使い方がわかるようにする不明なので、説明を書く
    - FP側で一括予約ができるようにAタグ→セレクトボックスに変更する
    - ユーザ側から、見た時、営業時間外なのか予約枠がないのかをまとめて表示しているが、FP側のように分ける

- 機能追加
    - ユーザ、FPの削除機能を作る(デフォルトのものがあるが、画面遷移からいけるようにする)
    - ユーザの予約時にFPを選択できるようにする

- マジックナンバー、マジックストリングを解消する
    - 合わせて、railsの一般的なconfigの定義の記載場所を調べる

- ログイン機能を根本からちゃんとする
    - LaravelのようにAuthのように、railsの一般的な方法を調べてそれに合わせる

- ビジネスロジックの一部をServiseに移行する

- RouteのGETとPOSTなどを適切なものに修正する

- cron機能を使う機能を、1つ何か作る