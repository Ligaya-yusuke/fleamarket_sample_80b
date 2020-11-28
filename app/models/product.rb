class Product < ApplicationRecord
  belongs_to :user
  belongs_to :category
  
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
  validates :name, :images, :infomation, :price, :prefecture_id, :condition_id, :delivery_charge_id, :shipping_day_id, :category_id, presence: true

  #以下のコメントアウトはのちの作業時に使用する。
  # belongs_to :seller, class_name: "User"
  belongs_to :buyer, class_name: "User", optional: true
 
  # has_many :order_histories, dependent: :destroy
  # has_many :comments, dependent: :destroy
  # has_many :likes, dependent: :destroy
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture


  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true



  belongs_to_active_hash :condition
  belongs_to_active_hash :delivery_charge
  belongs_to_active_hash :shipping_day
end

