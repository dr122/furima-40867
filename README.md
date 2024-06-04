# テーブル設計

## usersテーブル

| Column             | Type   | Options                   |
|--------------------|--------|---------------------------|
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| profile            | string | null: false               |

### Association

- has_many :items
- has_many :orders


## itemsテーブル

| Column        | Type       | Options                        |
|---------------|------------|--------------------------------|
| user          | references | null: false, foreign_key: true |
| name          | string     | null: false                    |
| description   | text       |                                |
| price         | decimal    | null: false                    |
| condition     | string     | null: false                    |
| shipping_fee  | string     | null: false                    |
| shipping_from | string     | null: false                    |
| shipping_days | string     | null: false                    |

### Association

- belongs_to :user
- has_one :order


## ordersテーブル

| Column         | Type       | Options                        |
|----------------|------------|--------------------------------|
| user           | references | null: false, foreign_key: true |
| item           | references | null: false, foreign_key: true |
| address        | references | null: false, foreign_key: true |
| amount         | decimal    | null: false                    |

### Association

- belongs_to :user
- belongs_to :item
- belongs_to :address


## addressesテーブル

| Column       | Type       | Options                        |
|--------------|------------|--------------------------------|
| user         | references | null: false, foreign_key: true |
| postal_code  | string     | null: false                    |
| prefecture   | string     | null: false                    |
| city         | string     | null: false                    |
| address_line | string     | null: false                    |
| building     | string     |                                |
| phone_number | string     | null: false                    |

### Association

- has_many :orders