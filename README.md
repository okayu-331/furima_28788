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

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- | 
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| family_name        | string  | null: false               |
| first_name         | string  | null: false               |
| family_name_kana   | string  | null: false               |
| first_name_kana    | string  | null: false               |
| birthday_year      | integer | null: false               |
| birthday_month     | integer | null: false               |
| birthday_day       | integer | null: false               |

### Association
- has_many :items
- belongs_to_active_hash :birthday_year
- belongs_to_active_hash :birthday_month
- belongs_to_active_hash :birthday_day


## items テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| name            | string     | null: false                    | 
| description     | text       | null: false                    |
| category        | integer    | null: false                    |
| status          | integer    | null: false                    |
| shipping_fee    | integer    | null: false                    |
| shipping_origin | integer    | null: false                    |
| shipping_days   | integer    | null: false                    |
| price           | integer    | null: false                    |
| sold            | boolean    | null: false, default: false    |
| user            | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one_attached :image
- has_one :payment
- has_one :shipping
- belongs_to_active_hash :category
- belongs_to_active_hash :status
- belongs_to_active_hash :shipping_fee
- belongs_to_active_hash :shipping_origin
- belongs_to_active_hash :shipping_days


## active_storage_blobs テーブル

| Column       | Type   | Options                   |
| ------------ | ------ | ------------------------- |
| key          | string | null: false, unique: true |
| filename     | string | null: false               |
| content_type | string |                           |
| metadata     | text   |                           |
| byte_size    | bigint | null: false               |
| checksum     | string | null: false               |

## active_storage_attachments  テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| name        | string     | null: false                    |
| record      | references | null: false, polymorphic: true |
| blob        | references | null: false, foreign_key: true |


## payments テーブル

| Column | Type       | Options                        |
| ------ | ---------- | -----------------------------  |
| item   | references | null: false, foreign_key: true |

### Association
- belongs_to :item


## shippings テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| postal_code  | string     | null: false                    |
| prefecture   | string     | null: false                    |
| city         | string     | null: false                    |
| address      | string     | null: false                    |
| building     | string     |                                |
| phone_number | integer    | null: false                    |
| item         | references | null: false, foreign_key: true |

### Association
- belongs_to :item
- belongs_to_active_hash :prefecture