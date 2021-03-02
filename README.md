# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# データベース設計

## Users テーブル

| Column                | Type    | Option     |
| --------------------- | ------- | ---------- |
| nickname              | String  | null:false |
| password              | String  | null:false |
| password_confirmation | String  | null:false |
| email                 | String  | null:false |
| last_name             | String  | null:false |
| first_name            | String  | null:false |
| base_last_name        | String  | null:false |
| base_first_name       | String  | null:false |
| birth_date            | Integer | null:false |
### Association
has_many :items
has_one :iem_record

## items テーブル

| Column            | Type       | Option           |
| ----------------- | ---------- | ---------------- |
| name              | String     | null:false       |
| info              | text       | null:false       |
| category_id       | String     | null:false       |
| condition_id      | Integer    | null:false       |
| delivery_pay_id   | Integer    | null:false       |
| delivery_place_id | Integer    | null:false       |
| delivery_date_id  | Integer    | null:false       |
| price             | Integer    | null:false       |
| user              | references | foreign_key:true |

### Association
belongs_to :user
has_one :pay
has_one :item_record

## payテーブル
| Column        | Type    | Option     |
| ------------- | ------- | ---------- |
| post_num      | String  | null:false |
| prefecture_id | Integer | null:false |
| city          | String  | null:false |
| address       | String  | null:false |
| building      | String  |            |
| phone         | String  | null:false |

### Association
belongs_to :items

## item_record テーブル

| Column  | Type       | Option           |
| ------- | ---------- | ---------------- |
| user_id | references | foreign_key:true |
| item_id | references | foreign_key:true |

### Association
belongs_to :user
belongs_to :item
