class Product < ApplicationRecord

  belongs_to :category
  # belongs_to :seller, class_name: User, foreign_key:user_id
  # belongs_to :buyer, class_name: User, foreign_key:buyer_id, optional: true
 
  # has_many :order_histories, dependent: :destroy
  # has_many :comments, dependent: :destroy
  # has_many :likes, dependent: :destroy
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true

end