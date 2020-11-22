require 'rails_helper'

describe User do
  # describe '#create' do
  #   # 1. nicknameとemail、passwordとpassword_confirmationが存在すれば登録できること
  #   it "is valid with a nickname, email, encrypted_password" do
  #     user = build(:user)
  #     expect(user).to be_valid
  #   end

  #   # 2. nicknameが空では登録できないこと
  #   it "is invalid without a nickname" do
  #     user = build(:user, nickname: nil)
  #     user.valid?
  #     expect(user.errors[:nickname]).to include("が入力されていません。")
  #   end

  #   # 3. emailが空では登録できないこと
  #   it "is invalid without a email" do
  #     user = build(:user, email: nil)
  #     user.valid?
  #     expect(user.errors[:email]).to include("が入力されていません。")
  #   end

  #   # 4. passwordが空では登録できないこと
  #   it "is invalid without a password" do
  #     user = build(:user, password: nil)
  #     user.valid?
  #     expect(user.errors[:password]).to include("が入力されていません。")
  #   end

  #   # 5. passwordが存在してもpassword_confirmationが空では登録できないこと
  #   it "is invalid without a password_confirmation although with a encrypted_password" do
  #     user = build(:user, password_confirmation: "")
  #     user.valid?
  #     expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
  #   end

  #   # 6. 重複したemailが存在する場合登録できないこと
  #   it "is invalid with a duplicate email address" do
  #     user = create(:user)
  #     another_user = build(:user, email: user.email)
  #     another_user.valid?
  #     expect(another_user.errors[:email]).to include("は既に使用されています。")
  #   end

  #   # 7. passwordが7文字以上であれば登録できること
  #   it "is valid with a password that has more than 7 characters " do
  #     user = build(:user, encrypted_password: "0000000")
  #     expect(user).to be_valid
  #   end

  #   # 8. passwordが6文字以下であれば登録できないこと
  #   it "is invalid with a password that has less than 5 characters " do
  #     user = build(:user, password: "000000")
  #     user.valid?
  #     expect(user.errors[:password]).to include("は7文字以上に設定して下さい。")
  #   end

  #   # 9. 重複したnicknameが存在する場合登録できないこと
  #   it "is invalid with a duplicate nickname" do
  #     user = create(:user)
  #     another_user = build(:user, nickname: user.nickname)
  #     another_user.valid?
  #     expect(another_user.errors[:nickname]).to include("は既に使用されています。")
  #   end
  # end
end