# rails_session_login_task

Webエンジニア ステップアップコース（Ruby）で使用するRails課題用アプリケーションです。

## 動作環境

- Ruby 4.0.5
- Ruby on Rails 8.1.3
- Bundler 4.0.10
- PostgreSQL 18.4
- Node.js 24.18.0
- Yarn 1.22.22

## セットアップ

PostgreSQLを起動してから、次のコマンドを実行してください。

```bash
bundle install
yarn install --frozen-lockfile
bin/rails db:prepare
```

`DATABASE_URL`を設定していない場合、development環境では
`rails_session_login_task_development`データベースを使用します。

## サーバー起動

```bash
bin/rails server
```

<http://localhost:3000> へアクセスしてください。

## テスト

```bash
bundle exec rails test
```

CIでは評価用のRSpecコードを`spec`ディレクトリへ配置したうえで、
`bundle exec rspec`も実行します。

## 環境変数

- `DATABASE_URL`: PostgreSQLへの接続URL（任意）
- `RAILS_MASTER_KEY`: production環境で暗号化credentialsを利用する場合に必要
- `rails_session_login_task_DATABASE_PASSWORD`: production用DBパスワード
