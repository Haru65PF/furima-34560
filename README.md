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

| Column          | Type    | Option     |
| --------------- | ------- | ---------- |
| nickname        | String  | null:false |
| password        | String  | null:false |
| email           | String  | null:false |
| last-name       | String  | null:false |
| first-name      | String  | null:false |
| base-last-name  | String  | null:false |
| base-first-name | String  | null:false |
| birth-year      | Integer | null:false |
| birth-month     | Integer | null:false |
| birth-day       | Integer | null:false |

### Association
has_many :items

## items テーブル

| Column         | Type       | Option     |
| -------------- | ---------- | ---------- |
| name           | String     | null:false |
| info           | text       | null:false |
| category       | String     | null:false |
| condition      | String     | null:false |
| delivery-pay   | String     | null:false |
| delivery-place | String     | nul:false  |
| delivery-date  | Integer    | null:false |
| price          | Integer    | null:false |
| user           | references |            |

### Association
belongs_to :user
has_one :pay

## payテーブル
| Column        | Type     | Option     |
| ------------- | -------- | ---------- |
| card-num      | Interger | null:false |
| term-month    | Integer  | null:false |
| term-year     | Integer  | null:false |
| security-code | Integer  | null:false |
| post-num      | Integer  | null:false |
| prefecture    | String   | null:false |
| city          | String   | null:false |
| address       | String   | null:false |
| building      | String   | null:false |
| phone         | Integer  | null:false |

### Association
belongs_to :items
