# テーブル設計

## users テーブル

| Column           | Type   | Options    |
| ---------        | ------ | ---------- |
| nickname         | string | null:false |
| email            | string | null:false |
| password         | string | null:false |
| family_name      | string | null:false |
| first_name       | string | null:false |
| family_name_kana | string | null:false |
| first_name_kana  | string | null:false |
| birthday         | date   | null:false |

### Association

- has_many :items
- has_one  :address
- has_one  :order


## items テーブル

| Column            | Type      | Options                       |
| --------------    | ----------|------------------------------ |
| image             | string    | null:false                    |
| name              | string    | null:false                    |
| text              | text      | null:false                    |
| category_id       | integer   | null:false                    |
| item_condition_id | integer   | null:false                    |
| postage_id        | integer   | null:false                    |
| prefecture_id     | integer   | null:false                    |
| delivery_time_id  | integer   | null:false                    |
| price             | integer   | null:false                    |
| user              | reference | null:false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order 


## address テーブル

| Column           | Type      | Options                        |
| -----------      | ----------|------------------------------- |
| postal_code      | string    | null:false                     |
| prefecture_id    | integer   | null:false                     |
| city             | string    | null:false                     |
| house_number     | string    | null:false                     |
| building_name    | string    |                                |
| telephone_number | string    | null:false                     |
| order            | reference | null:false, foreign_key: true  |

### Association

- belong_to :order


## order テーブル

| Column      | Type      | Options                       |
| ----------- | --------- | ----------------------------- |
| user        | reference | null:false, foreign_key: true |
| item        | reference | null:false, foreign_key: true |

### Association

- belong_to :user
- belong_to :item
- has_one :address