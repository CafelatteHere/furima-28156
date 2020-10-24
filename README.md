#テーブル設計

## usersテーブル

| Column      | Type    | Options     |
| ----------- | ------- | ----------- |
| nickname    | string  | null: false |
| email       | string  | null: false |
| password    | string  | null: false |
| surname     | string  | null: false |
| name        | string  | null: false |
| birth_year  | integer | null: false |
| birth_month | integer | null: false |
| birth_day   | integer | null: false |

### Association

- has_many: items
- has_many: orders

## items テーブル

| Column           | Type              | Options                        |
| ---------------- | ------------------| ------------------------------ |
| image            | has_one_attached  | null: false                    |
| item_name        | string            | null: false                    |
| description      | text              | null: false                    |
| category_id      | integer           | null: false                    |
| condition_id     | integer           | null: false                    |
| shipment_type_id | integer           | null: false                    |
| area_id          | integer           | null: false                    |
| days_to_ship_id  | integer           | null: false                    |
| price            | integer           | null: false                    |
| user             | references        | null: false, foreign_key: true |

### Association

- belongs_to: user
- has_one: order

## orders テーブル

| Column      | Type              | Options                        |
| ----------- | ------------------| ------------------------------ |
| item_id     | references        | null: false, foreign_key: true |
| card_number | integer           | null: false                    |
| month       | integer           | null: false                    |
| year        | integer           | null: false                    |
| cvc         | integer           | null: false                    |

### Association

- belongs_to: user
- has_one: order
- has_one: shipment

# shipments テーブル

 Column         | Type              | Options                        |
| ------------- | ------------------| ------------------------------ |
| user_id       | references        | null: false, foreign_key: true |
| item_id       | references        | null: false, foreign_key: true |
| zip-code      | string            | null: false                    |
| prefecture_id | integer           | null: false                    |
| city          | string            | null: false                    |
| house_number  | integer           | null: false                    |
| building_name | string            |                                |
| tel           | integer           | null: false                    |

### Association

- belongs_to: user
- belongs_to: order
