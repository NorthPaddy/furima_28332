# テーブル設計

## users テーブル

| Column      | Type   | Options    |
| ---------   | ------ | ---------- |
| nickname    | string | null:false |
| email       | string | null:false |
| password    | string | null:false |
| family_name | string | null:false |
| first_name  | string | null:false |
| birthday    | string | null:false |

### Association

- has_many :item
- has_one  :address


## items テーブル

| Column      | Type      | Options                       |
| ----------- | ----------|------------------------------ |
| item_name   | string    | null:false                    |
| item_image  | string    | null:false                    |
| item_text   | text      | null:false                    |
| price       | string     | null:false                   |
| user        | reference | null:false, foreign_key: true |
| order       | reference | null:false, foreign_key: true |

### Association

- belongs_to :user
- has_one :orders 


## address テーブル

| Column           | Type      | Options                       |
| -----------      | ----------|------------------------------ |
| postal_code      | string    | null:false                    |
| prefecture       | string    | null:false                    |
| city             | string    | null:false                    |
| house_number     | string    | null:false                    |
| building_name    | string    | null:false                    |
| telephone_number | reference | null:false, foreign_key: true |
| user             | reference | null:false, foreign_key: true |

### Association

- belong_to :user
- has_one :order


## order テーブル

| Column      | Type      | Options                       |
| ----------- | --------- | ----------------------------- |
| price       | string    | null:false                    |
| address     | reference | null:false, foreign_key: true |

### Association

- belong_to :item
- belong_to :address