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

# テーブル設計

## users テーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| password           | string | null: false |
| email              | string | null: false |
| first_name         | string | null: false |
| family_name        | string | null: false |
| first_name_kana    | string | null: false |
| family_name_kana   | string | null: false |
| birthday           | date   | null: false |


### Association
- has_many :items
- has_many :purchase_histories

## items テーブル
| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| image           | string     | null: false                    |
| name            | string     | null: false                    |
| explanation     | text       | null: false                    |
| category        | integer    | null: false                    |
| condition       | integer    | null: false                    |
| postage_type    | integer    | null: false                    |
| shipping_region | integer    | null: false                    |
| preparation_day | integer    | null: false                    |
| price           | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :purchase_history

## shipping_addresses テーブル
| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| post_code        | integer    | null: false                    |
| prefecture_name  | integer    | null: false                    |
| city             | string     | null: false                    |
| house_number     | string     | null: false                    |
| building_name    | string     |                                |
| phone_number     | string     | null: false                    |
| purchase_history | references | null: false, foreign_key: true |

### Association
- belongs_to :purchase_history

## purchase_histories テーブル
| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| user            | references | null: false, foreign_key: true |
| item            | references | null: false, foreign_key: true |

### Association
- has_one :shipping_address
- belongs_to :user
- belongs_to :item
