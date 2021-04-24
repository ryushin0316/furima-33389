# テーブル設計

## Usersテーブル
| Column             | Type   | Options                  |
| ------------------ | ------ | ------------------------ |
| nickname           | string | null: false              |
| email              | string | null: false unique: true |
| encrypted_password | string | null: false              |
| name               | string | null: false              |
| birthday           | text   | null: false              |


### Association

- has_many :buys
- has_many :items, through: items_users
- has_many :delivery_users



## Itemsテーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| image           | text   | null: false |  商品画像を1枚つけることが必須であること
| name            | string | null: false |  商品名が必須であること
| text            | text   | null: false |  商品の説明が必須であること
| category        | string | null: false |  カテゴリーの情報が必須であること
| type            | text   | null: false |  商品の状態についての情報が必須であること
| delivery-pay    | text   | null: false |  配送料の負担についての情報が必須であること
| area            | text   | null: false |  発送元の地域についての情報が必須であること
| day             | text   | null: false |  発送までの日数についての情報が必須であること
| price           | string | null: false |  価格についての情報が必須であること
  

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


## Deliverysテーブル

| Column | Type | Options |
| ------- | ------- | ------- |
| post-nunber | text | null: false |
| prefecture | text | null: false |
| city | text | null: false |
| number | text | null: false |
| phone | number | null: false |配送先の情報として、郵便番号・都道府県・市区町村・番地・電話番号が必須であること