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