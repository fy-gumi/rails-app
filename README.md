# README

## 環境構築手順

1. ファイルを作成
下記コマンドを実行

```
touch {Dockerfile,docker-compose.yml,Gemfile,Gemfile.lock,.env,entrypoint.sh}
```

2. 以下の4ファイルを作成(各ファイルgithub上にあげているので、内容はコピーしてください)
- Dockerfile
- docker-compose.yml
- Gemfile
- entrypoint.sh

※ Gemfile.lockは空のまま

3. rails new でアプリ作成
下記コマンドを実行

```
docker-compose run web rails new . --force --no-deps --database=mysql --webpacker
```