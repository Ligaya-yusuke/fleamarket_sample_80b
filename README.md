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

- has_one :adress, dependent: :destroy
- has_one :profile, dependent: :destroy
- has_one :credit_card, dependent: :destroy
- has_many :order_histories, dependent: :destroy
- has_many :comments, dependent: :destroy
- has_many :likes, dependent: :destroy
- has_many :products, dependent: :destroy

## credit_cardsテーブル

|Column|Type|Options|
|------|----|-------|
|card_number|integer|null: false, unique: true|
|expiration_year|integer|null: false|
|expiration_month|integer|null: false|
|security_code|integer|null: false|
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
|post_code|integer|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|block_number|string|null: false|
|building_number|string||
|phone_number|integer|null: false|
|user_id|references|null: false, foreign_key: true|

### Association

- belongs_to :user

## prefecturesテーブル(active_hash)

|Column|Type|Options|
|------|----|-------|
|prefecture|string||

### Association

- belongs_to :adress

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
|image_id|references|null: false, foreign_key: true|
|buyer_id|references|null: false, foreign_key: true|
|seller_id|references|null: false, foreign_key: true|

### Association

- belongs_to :category
- belongs_to :seller, class_name: User, foreign_key:seller_id
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

## categoriesテーブル(active_hash)

|Column|Type|Options|
|------|----|-------|
|category_name|string|null: false|

### Association

- has_many :products

## order_historiesテーブル(中間テーブル)

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|products_id|references|null: false, foreign_key: true|

### Association

- belongs_to :user
- belongs_to :product

## commentsテーブル(中間テーブル)

|Column|Type|Options|
|------|----|-------|
|comment|text||
|user_id|references|null: false, foreign_key: true|
|products_id|references|null: false, foreign_key: true|

### Association

- belongs_to :user
- belongs_to :product

## likesテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|products_id|references|null: false, foreign_key: true|

### Association

- belongs_to :user
- belongs_to :product