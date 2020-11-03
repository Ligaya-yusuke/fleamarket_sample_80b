class Product < ApplicationRecord
  belongs_to :category
  #以下のコメントアウトはのちの作業時に使用する。
  # belongs_to :seller, class_name: User, foreign_key:user_id
  # belongs_to :buyer, class_name: User, foreign_key:buyer_id, optional: true
  # has_many :images, dependent: :destroy
  # has_many :order_histories, dependent: :destroy
  # has_many :comments, dependent: :destroy
  # has_many :likes, dependent: :destroy
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

end
