# テーブル設計

## usersテーブル

| Column             | Type   | Options                   |
|--------------------|--------|---------------------------|
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| first_name         | string | null: false               |
| last_name          | string | null: false               |
| first_name_kana    | string | null: false               |
| last_name_kana     | string | null: false               |
| birth_date         | date   | null: false               |

### Association

- has_many :items
- has_many :orders


## itemsテーブル

| Column           | Type       | Options                        |
|------------------|------------|--------------------------------|
| user             | references | null: false, foreign_key: true |
| name             | string     | null: false                    |
| description      | text       | null: false                    |
| price            | integer    | null: false                    |
| category_id      | integer    | null: false                    |
| condition_id     | integer    | null: false                    |
| shipping_fee_id  | integer    | null: false                    |
| shipping_from_id | integer    | null: false                    |
| shipping_days_id | integer    | null: false                    |

### Association

- belongs_to :user
- has_one :order


## ordersテーブル

| Column         | Type       | Options                        |
|----------------|------------|--------------------------------|
| user           | references | null: false, foreign_key: true |
| item           | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address


## addressesテーブル

| Column           | Type       | Options                        |
|------------------|------------|--------------------------------|
| order            | references | null: false, foreign_key: true |
| postal_code      | string     | null: false                    |
| shipping_from_id | string     | null: false                    |
| city             | string     | null: false                    |
| address_line     | string     | null: false                    |
| building         | string     |                                |
| phone_number     | string     | null: false                    |

### Association

- belongs_to :order