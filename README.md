# 概要
URL：http://54.248.40.61/

Github（最終課題のリポジトリ）：https://github.com/Ligaya-yusuke/fleamarket_sample_80b

■ Basic認証
ID：nagoya80b
Pass：nagoya80b

■ テスト用アカウント
◯ 購入者用
メールアドレス：airforceone@a.com
パスワード：1qaz2wsx

◯ 購入用カード情報
番号：4242424242424242
期限：12/20
セキュリティカード：123

◯ 出品者用
メールアドレス：sample@a.com 
パスワード：1qaz2wsx 

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|encrypted_password|string|null: false|

### Association

- has_one :address, dependent: :destroy
- has_one :profile, dependent: :destroy
- has_one :credit_card, dependent: :destroy
- has_many :order_histories, dependent: :destroy
- has_many :comments, dependent: :destroy
- has_many :likes, dependent: :destroy
- has_many :products, dependent: :destroy

## credit_cardsテーブル

|Column|Type|Options|
|------|----|-------|
|customer_id|string|null: false|
|card_id|string|null: false|
|user_id|integer|null: false|

### Association

- belongs_to :user

## profilesテーブル

|Column|Type|Options|
|------|----|-------|
|first_name|string|null: false|
|family_name|string|null: false|
|first_name_kana|string|null: false|
|family_name_kana|string|null: false|
|birthday|date|null: false|
|introduction|text||
|user_id|references|null: false, foreign_key: true|

### Association

- belongs_to :user

## adressesテーブル

|Column|Type|Options|
|------|----|-------|
|ship_first_name|string|null: false|
|ship_family_name|string|null: false|
|ship_first_name_kana|string|null: false|
|ship_family_name_kana|string|null: false|
|post_code|string|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|block_number|string|null: false|
|building_number|string||
|phone_number|string|null: false|
|user_id|references|null: false, foreign_key: true|

### Association

- belongs_to :user

### productsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|information|text|null: false|
|price|string|null: false|
|brand|string||
|condition_id|integer|null: false|
|delivery_charge_id|integer|null: false|
|prefecture_id|integer|null: false|
|shipping_day_id|integer|null: false|
|category_id|references|null: false, foreign_key: true|
|user_id|references|null: false, foreign_key: true|

### Association

- belongs_to :seller, class_name: User, foreign_key:user_id
- belongs_to :buyer, class_name: User, foreign_key:buyer_id, optional: true
- has_many :images, dependent: :destroy
- has_many :order_histories, dependent: :destroy
- has_many :comments, dependent: :destroy
- has_many :likes, dependent: :destroy

## imagesテーブル

|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|product_id|references|null: false, foreign_key: true|

### Association

- belongs_to :product

## order_historiesテーブル(中間テーブル)

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|product_id|references|null: false, foreign_key: true|

### Association

- belongs_to :user
- belongs_to :product

## commentsテーブル(中間テーブル)

|Column|Type|Options|
|------|----|-------|
|comment|text||
|user_id|references|null: false, foreign_key: true|
|product_id|references|null: false, foreign_key: true|

### Association

- belongs_to :user
- belongs_to :product

## likesテーブル(中間テーブル)

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|product_id|references|null: false, foreign_key: true|

### Association

- belongs_to :user
- belongs_to :product

# README
<img width="1042" alt="最終課題ER図修正10" src="https://user-images.githubusercontent.com/62795565/99184809-fdade680-2788-11eb-84d8-f56bd339ac73.png">
