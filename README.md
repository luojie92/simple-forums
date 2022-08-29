# README

## 各套件使用版本 Versions

* Ruby 版本: 2.7.2

* Rails 版本: 6.1.2

* PostgreSQL 版本: v10

## 数据库

* `/config/database.yml` 数据库配置

* `RAILS_ENV=development rails db:create` 创建本地开发环境数据库

* `RAILS_ENV=development rails db:migrate` 执行迁移文件生成数据库表

* `RAILS_ENV=development rails db:seed` 初始化基础数据(版块初始2个)

## 服务启动

* `rails s` 本地

## 接口文档

[接口文档](https://www.apifox.cn/apidoc/shared-72f7f192-ef37-425a-8f26-9c4383a19e73)

访问密码：WVmsIBk3

## 全文检索优化

1.[elasticsearch](https://gems.ruby-china.com/gems/elasticsearch)

2.[pgroonga](https://pgroonga.github.io/)

考虑前期数据量，暂使用方案2:pgroonga，大致流程：

* `brew install pgroonga` 安装扩展，其他操作系统参考文档：https://pgroonga.github.io/install/

* `psql -d [数据库名] --command 'CREATE EXTENSION pgroonga'` 给指定数据库创建扩展

* `CREATE INDEX pgroonga_index_name ON rich_texts USING pgroonga (body);` 给富文本表rich_texts字段body创建pgroonga索引

* `SELECT * FROM rich_texts WHERE body &@ 'engine';` &@ &@~ LIKE ILIKE会走索引；
