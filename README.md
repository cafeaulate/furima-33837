# テーブル設計

## users テーブル

| Column             | Type       | Options                   |
| ------------------ | ---------- | ------------------------- |
| nickname           | string     | null: false               |
| email              | string     | null: false, unique: true |
| encrypted_password | string     | null: false               |
| f_name             | string     | null: false               |
| l_name             | string     | null: false               |
| f_name_kana        | string     | null: false               |
| l_name_kana        | string     | null: false               |
| birthday           | date       | null: false               |

### Association

- has_many :products
- has_many :records
- has_one :send


## products テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| product        | string     | null: false                    |
| text           | text       | null: false                    |
| category_id    | integer    | null: false                    | <!--Activehashで記述 -->
| status_id      | integer    | null: false                    | <!--Activehashで記述 -->
| charge_id      | integer    | null: false                    | <!--Activehashで記述 -->
| prefuctures_id | integer    | null: false                    | <!--Activehashで記述 -->
| span_id        | integer    | null: false                    | <!--Activehashで記述 -->
| price          | integer    | null: false                    |
| user           | reference  |  foreign_key: true             |


### Association

- belongs_to :user
- has_one :record

## records テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| user       | reference  | foreign_key: true              |
| product    | reference  | foreign_key: true              |

### Association

- belongs_to :product
- has_one :send

## sends テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| postal_code        | string     |                                |
| prefuctures_id     | integer    |                                | <!--Activehashで記述 -->
| manicipality       | string     |                                |
| address            | string     |                                |
| phone              | string     |                                |
| record             | reference  | foreign_key: true              |


### Association

- belongs_to :user
- belongs_to :record