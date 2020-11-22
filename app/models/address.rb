class Address < ApplicationRecord

  belongs_to :user, optional: true
  validates :ship_first_name, :ship_family_name, :ship_first_name_kana, :ship_family_name_kana, :post_code, :prefecture_id, :city, :block_number, :phone_number , presence: true
  validates :ship_first_name, :ship_family_name,
                        format: {
                          with: /\A[ぁ-んァ-ン一-龥]/,
                          message: "を全角文字で入力してください"
                        }
  validates :ship_first_name_kana, :ship_family_name_kana,
                        format: {
                          with: /\A[ぁ-んー－]+\z/,
                          message: "を全角文字で入力してください"
                        }
  validates :post_code,
                        format: {
                          with: /\A\d{3}[-]\d{4}\z/,
                          message: "(3桁-4桁)" 
                        }

  # jp_prefecture :prefecture_code

  #   def prefecture_name
  #     JpPrefecture::Prefecture.find(code: prefecture).try(:name)
  #   end

  #   def prefecture_name=(prefecture_name)
  #     self.prefecture_code = JpPrefecture::Prefecture.find(name: prefecture_name).code
  #   end
  # end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
end
