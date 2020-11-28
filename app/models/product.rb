class Product < ApplicationRecord
  belongs_to :user
  belongs_to :category,    optional: true
  
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
  validates :name, :images, :infomation, :price, :prefecture_id, :condition_id, :delivery_charge_id, :shipping_day_id, :category_id, presence: true
  validates :infomation, length: { maximum: 300 }
  validates :price,
            numericality: {
              less_than_or_equal_to: 9999999,
              greater_than_or_equal_to: 300,
              message: "は300円以上、9999999円以下にしてください"
            }
  #以下のコメントアウトはのちの作業時に使用する。
  # belongs_to :seller, class_name: User, foreign_key: user_id
  # belongs_to :buyer, class_name: User, foreign_key: buyer_id, optional: true
 
  # has_many :order_histories, dependent: :destroy
  # has_many :comments, dependent: :destroy
  # has_many :likes, dependent: :destroy
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture






  belongs_to_active_hash :condition
  belongs_to_active_hash :delivery_charge
  belongs_to_active_hash :shipping_day
end

