# テーブル設計


## Usersテーブル
| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association

- has_many :buys
- has_many :items



## Itemsテーブル

| Column | Type   | Options     |
| -------| ------ | ----------- |
| name   | string | null: false |
| price  | string | null: false |
| text   | text   | null: false |

### Association

- belongs_to :users
- belongs_to :buys


## Buysテーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| text   | text   | null: false, foreign_key: true |


### Association

- belongs_to :users
- has_many :items