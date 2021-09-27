# README

## customersテーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| first_name      | string | null: false |
| last_name       | string | null: false |
| first_name_kana | string | null: false |
| last_name_kana  | string | null: false |
| address         | string | null: false |
| phone_number    | string | null: false |
| birth_date      | date   | null: false |
| job             | string | null: false |
| remarks         | text   |             |


### Association
- has_many :pawns
- has_many :purchases


## pawnsテーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| item_name    | string     | null: false                    |
| item_price   | integer    | null: false                    |
| item_detail  | text       | null: false                    |
| item_remarks | text       |                                |
| item_status  | integer    | null: false                    |
| customer     | references | null: false, foreign_key: true |

### Association
- belongs_to :customer
- has_many   :interests


## interestsテーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| interests_number | integer    | null: false                    |
| pawn             | references | null: false, foreign_key: true |

### Association
- belongs_to :pawn


## purchasesテーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| buy_item_name   | string     | null: false                    |
| buy_item_price  | integer    | null: false                    |
| buy_item_detail | text       | null: false                    |
| customer        | references | null: false, foreign_key: true |

### Association
- belongs_to :customer


## daily_work_checksテーブル

| Column       | Type | Options     |
| ------------ | ---- | ----------- |
| message_time | time | null: false |


## gold_pricesテーブル

| Column       | Type    | Options     |
| ------------ | ------- | ----------- |
| k18_price    | integer | null: false |
| k14_price    | integer | null: false |
| k24_price    | integer | null: false |
| k18wg_price  | integer | null: false |
| k14wg_price  | integer | null: false |
| pt850_price  | integer | null: false |
| pt900_price  | integer | null: false |
| pt950_price  | integer | null: false |
| pt1000_price | integer | null: false |
