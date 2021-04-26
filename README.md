# テーブル設計


## Usersテーブル
| Column             | Type   | Options                  |
| ------------------ | ------ | ------------------------ |
| nickname           | string | null: false              |
| email              | string | null: false unique: true |
| encrypted_password | string | null: false              |
| family_name        | string | null: false              |
| first_name          | string | null: false             |
| family_name_ruby | string | null: false |
| first_name_ruby | string | null:false |
| birthday           | date  | null: false              |


### Association

- has_many :buys
- has_many :items



## Itemsテーブル

| Column          | Type    | Options     |
| --------------- | ------  | ----------- |
| name            | string  | null: false |  商品名が必須であること
| text            | text    | null: false |  商品の説明が必須であること
| category_id     | integer | null: false |  カテゴリーの情報が必須であること
| type_id         | integer | null: false |  商品の状態についての情報が必須であること
| delivery_pay_id | integer | null: false |  配送料の負担についての情報が必須であること
| area_id         | integer | null: false |  発送元の地域についての情報が必須であること
| day_id          | integer | null: false |  発送までの日数についての情報が必須であること
| price           | integer | null: false |  価格についての情報が必須であること
| user | references | null: false, foreign_key: true |

  

### Association

- belongs_to :user
- has_one :buy
- 



## Buysテーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| user | references | null: false, foreign_key: true |
| item | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :item
- has_one :delivery


## Deliverysテーブル

| Column | Type | Options |
| ------- | ------- | ------- |
| area_id | integer | null: false | 
| post_number | string | null: false |
| city | string | null: false |
| number | string | null: false |
| phone_number | string | null: false |配送先の情報として、郵便番号・都道府県・市区町村・番地・電話番号が必須であること
| building_name | string |
| buy | references | null: false, foreign_key: true |

### Association
 - belongs_to :buy