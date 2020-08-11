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
| birth_year         | date   | null: false |
| birth_month        | date   | null: false |
| birth_day          | date   | null: false |

### Association
- has_many :items
- has_one :credit_cards
- has_one :shipping_address

## items テーブル
| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| image           | text       | null: false                    |
| name            | string     | null: false                    |
| explanation     | text       | null: false                    |
| category        | string     | null: false                    |
| condition       | string     | null: false                    |
| postage_type    | string     | null: false                    |
| shipping_region | string     | null: false                    |
| preparation_day | string     | null: false                    |
| price           | integer    | null: false                    |
| user_id         | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :purchases

##  purchases テーブル
| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| user_id         | references | null: false, foreign_key: true |
| item_id         | references | null: false, foreign_key: true |

### Association
- belongs_to :item
- belongs_tp :user


## credit_cards テーブル
| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| card_number      | integer    | null: false, unique: true      |
| expiration_month | integer    | null: false                    |
| expiration_year  | integer    | null: false                    |
| security_code    | integer    | null: false                    |
| user_id          | references | null: false, foreign_key: true |

### Association
- belongs_to :user

## shipping_addresses テーブル
| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| post_code       | integer    | null: false                    |
| prefecture_name | string     | null: false                    |
| city            | string     | null: false                    |
| house_number    | string     | null: false                    |
| building_name   | string     |                                |
| phone_number    | integer    | null: false                    |
| user_id         | references | null: false, foreign_key: true |

### Association
- belongs_to :user