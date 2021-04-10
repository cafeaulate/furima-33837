# テーブル設計

## users テーブル

| Column         | Type       | Options                   |
| -------------- | ---------- | ------------------------- |
| nickname       | string     | null: false               |
| email          | string     | null: false, unique: true |
| pass           | string     | null: false               |
| f_name         | string     | null: false               |
| l_name         | string     | null: false               |
| f_name_kana    | string     | null: false               |
| l_name_kana    | string     | null: false               |
| year           | integer    | null: false               | <!--Activehashで記述 -->
| month          | integer    | null: false               | <!--Activehashで記述 -->
| day            | integer    | null: false               | <!--Activehashで記述 -->

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
| area_id        | integer    | null: false                    | <!--Activehashで記述 -->
| span_id        | integer    | null: false                    | <!--Activehashで記述 -->
| price          | integer    | null: false                    |
| user           | reference  |                                |


### Association

- belongs_to :users
- has_one :records
- has_one :sends

## records テーブル

| Column     | Type       | Options                        |　
| ---------- | ---------- | ------------------------------ |
| user       | reference  |                                |
| product    | reference  |                                |

### Association

- belongs_to :products

## sends テーブル

| Column             | Type       | Options                        |　
| ------------------ | ---------- | ------------------------------ |
| postal_code        | string     |                                |
| prefuctures_id     | integer    |                                | <!--Activehashで記述 -->
| manicipality       | text       |                                |
| address            | string     |                                |
| phone              | integer    |                                |

### Association

- belongs_to :products