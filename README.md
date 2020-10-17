# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

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
|user_id|references|null: false, foreign_key: true|

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
|condition|string|null: false|
|delivery_charge|string|null: false|
|prefecture_id|string|null: false|
|shipping_day|string|null: false|
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

## likesテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|product_id|references|null: false, foreign_key: true|

### Association

- belongs_to :user
- belongs_to :product

# README
<img width="831" alt="最終課題ER図修正4" src="https://user-images.githubusercontent.com/62795565/96328460-5309b180-107e-11eb-8256-874dfe97abe8.png">
