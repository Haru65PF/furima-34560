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

| Column             | Type   | Option                  |
| ------------------ | ------ | ----------------------- |
| nickname           | String | null:false              |
| encrypted_password | String | null:false              |
| email              | String | null:false, unique:true |
| last_name          | String | null:false              |
| first_name         | String | null:false              |
| base_last_name     | String | null:false              |
| base_first_name    | String | null:false              |
| birth_date         | Date   | null:false              |

### Association
has_many :items
has_many :item_records

## items テーブル

| Column            | Type       | Option           |
| ----------------- | ---------- | ---------------- |
| name              | String     | null:false       |
| info              | text       | null:false       |
| category_id       | Integer    | null:false       |
| condition_id      | Integer    | null:false       |
| delivery_pay_id   | Integer    | null:false       |
| delivery_place_id | Integer    | null:false       |
| delivery_date_id  | Integer    | null:false       |
| price             | Integer    | null:false       |
| user              | references | foreign_key:true |

### Association
belongs_to :user
has_one :item_record

## addresses テーブル
| Column        | Type       | Option           |
| ------------- | ---------- | ---------------- |
| post_num      | String     | null:false       |
| prefecture_id | Integer    | null:false       |
| city          | String     | null:false       |
| address       | String     | null:false       |
| building      | String     |                  |
| phone         | String     | null:false       |
| item_record   | references | foreign_key:true |

### Association
belongs_to item_record

## item_records テーブル

| Column  | Type       | Option           |
| ------- | ---------- | ---------------- |
| user    | references | foreign_key:true |
| item    | references | foreign_key:true |

### Association
belongs_to :user
belongs_to :item
has_one :address
