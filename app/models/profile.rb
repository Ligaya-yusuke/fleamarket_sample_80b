class Profile < ApplicationRecord
  belongs_to :user, optional: true
  validates :first_name, :family_name, :family_name_kana, :first_name_kana, :birthday ,presence: true
  validates :first_name, :family_name,
                        format: {
                          with: /\A[ぁ-んァ-ン一-龥]/,
                          message: "を全角文字で入力してください"
                        }
  validates :family_name_kana, :first_name_kana,
                        format: {
                          with: /\A[ぁ-んー－]+\z/,
                          message: "を全角で入力してください"
                        }
end
