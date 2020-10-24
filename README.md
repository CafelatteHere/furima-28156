#テーブル設計

## usersテーブル

| Column           | Type    | Options                   |
| ---------------- | ------- | ------------------------- |
| nickname         | string  | null: false, unique: true |
| email            | string  | null: false, unique: true |
| password         | string  | null: false               |
| surname          | string  | null: false               |
| name             | string  | null: false               |
| surname_furigana | string  | null: false               |
| name_furigana    | string  | null: false               |
| birthday         | date    | null: false               |

### Association

- has_many: items
- has_many: orders

## items テーブル

| Column           | Type              | Options                        |
| ---------------- | ------------------| ------------------------------ |
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

| Column  | Type              | Options                        |
| ------- | ----------------- | ------------------------------ |
| user    | references        | null: false, foreign_key: true |
| item    | references        | null: false, foreign_key: true |


### Association

- belongs_to: user
- belongs_to: item
- has_one: shipment

# shipments テーブル

 Column         | Type              | Options                        |
| ------------- | ------------------| ------------------------------ |
| order         | references        | null: false, foreign_key: true |
| zip-code      | string            | null: false                    |
| prefecture_id | integer           | null: false                    |
| city          | string            | null: false                    |
| house_number  | string            | null: false                    |
| building_name | string            |                                |
| tel           | string            | null: false                    |

### Association

- belongs_to: order
