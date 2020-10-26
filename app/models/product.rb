class Product < ApplicationRecord
  belongs_to :user, foreign_key:user_id
  has_many :comments
  has_many :order_histories, dependent: :destroy
  has_many :likes
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true

  # 空のデータ登録できない
  validates :name, presence:true

end
