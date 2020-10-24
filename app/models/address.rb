class Address < ApplicationRecord
  belongs_to :user, optional: true
  validates :ship_first_name, :ship_family_name, :ship_first_name_kana, :ship_family_name_kana, :post_code, :prefecture, :city, :block_number, :phone_number , presence: true
  validates :ship_first_name_kana, :ship_family_name_kana,
                        format: {
                          with: /\A[ぁ-んー－]+\z/,
                          message: "全角文字で入力してください"
                        }

  # jp_prefecture :prefecture_code

  #   def prefecture_name
  #     JpPrefecture::Prefecture.find(code: prefecture).try(:name)
  #   end

  #   def prefecture_name=(prefecture_name)
  #     self.prefecture_code = JpPrefecture::Prefecture.find(name: prefecture_name).code
  #   end
end
