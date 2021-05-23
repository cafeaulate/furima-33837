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


## products テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| product        | string     | null: false                    |
| text           | text       | null: false                    |
| category_id    | integer    | null: false                    | <!--Activehashで記述 -->
| status_id      | integer    | null: false                    | <!--Activehashで記述 -->
| charge_id      | integer    | null: false                    | <!--Activehashで記述 -->
| prefucture_id  | integer    | null: false                    | <!--Activehashで記述 -->
| span_id        | integer    | null: false                    | <!--Activehashで記述 -->
| price          | integer    | null: false                    |
| user           | references | foreign_key: true              |


### Association

- belongs_to :user
- has_one :log

## logs テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| user       | references | foreign_key: true              |
| item       | references | foreign_key: true              |

### Association

- belongs_to :product
- has_one :send
- belongs_to :user

## sends テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| postal_code        | string     | null: false                    |
| prefucture_id      | integer    | null: false                    | <!--Activehashで記述 -->
| manicipality       | string     | null: false                    |
| address            | string     | null: false                    |
| building           | string     |                                |
| phone              | string     | null: false                    |
| log                | references | foreign_key: true              |


### Association

- belongs_to :log