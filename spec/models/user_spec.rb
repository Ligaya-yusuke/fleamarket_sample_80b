require 'rails_helper'

describe User do
  describe '#create' do
    # 1. nicknameとemail、passwordとpassword_confirmationが存在すれば登録できること
    it "is valid with a nickname, email, encrypted_password" do
      user = build(:user)
      expect(user).to be_valid
    end

    # 2. nicknameが空では登録できないこと
    it "is invalid without a nickname" do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("が入力されていません。")
    end

    # 3. emailが空では登録できないこと
    it "is invalid without a email" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("が入力されていません。")
    end

    # 4. passwordが空では登録できないこと
    it "is invalid without a password" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("が入力されていません。")
    end

    # 5. passwordが存在してもpassword_confirmationが空では登録できないこと
    it "is invalid without a password_confirmation although with a encrypted_password" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
    end

    # 6. 重複したemailが存在する場合登録できないこと
    it "is invalid with a duplicate email address" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("は既に使用されています。")
    end

    # 7. passwordが7文字以上であれば登録できること
    it "is valid with a password that has more than 7 characters " do
      user = build(:user, encrypted_password: "0000000")
      expect(user).to be_valid
    end

    # 8. passwordが6文字以下であれば登録できないこと
    it "is invalid with a password that has less than 5 characters " do
      user = build(:user, password: "000000")
      user.valid?
      expect(user.errors[:password]).to include("は7文字以上に設定して下さい。")
    end

    # 9. 重複したnicknameが存在する場合登録できないこと
    it "is invalid with a duplicate nickname" do
      user = create(:user)
      another_user = build(:user, nickname: user.nickname)
      another_user.valid?
      expect(another_user.errors[:nickname]).to include("は既に使用されています。")
    end
  end
end

describe Profile do
  describe '#create' do
    # 10. first_nameが空では登録できないこと、全角文字のみ入力できる
    it "is invalid without a first_name" do
      user = build(:profile, first_name: nil)
      user.valid?
      expect(user.errors[:first_name]).to include("を入力してください", "全角文字で入力してください")
    end

    # 11. family_nameが空では登録できないこと、全角文字のみ入力できる
    it "is invalid without a family_name" do
      user = build(:profile, family_name: nil)
      user.valid?
      expect(user.errors[:family_name]).to include("を入力してください", "全角文字で入力してください")
    end

    # 12. family_name_kanaが空では登録できないこと、全角のみ入力できる
    it "is invalid without a family_name_kana" do
      user = build(:profile, family_name_kana: nil)
      user.valid?
      expect(user.errors[:family_name_kana]).to include("を入力してください", "全角で入力してください")
    end

    # 13. first_name_kanaが空では登録できないこと、全角のみ入力できる
    it "is invalid without a first_name" do
      user = build(:profile, first_name_kana: nil)
      user.valid?
      expect(user.errors[:first_name_kana]).to include("を入力してください", "全角で入力してください")
    end

    # 14. birthdayが空では登録できないこと
    it "is invalid without a birthday" do
      user = build(:profile, birthday: nil)
      user.valid?
      expect(user.errors[:birthday]).to include("を入力してください")
    end

  end 
end

describe Address do
  describe '#create' do
    # 15. ship_first_nameが空では登録できないこと、全角文字のみ入力できる
    it "is invalid without a ship_first_name" do
      user = build(:address, ship_first_name: nil)
      user.valid?
      expect(user.errors[:ship_first_name]).to include("を入力してください")
    end

    # 16. ship_family_nameが空では登録できないこと、全角文字のみ入力できる
    it "is invalid without a ship_family_name" do
      user = build(:address, ship_family_name: nil)
      user.valid?
      expect(user.errors[:ship_family_name]).to include("を入力してください")
    end

    # 17. ship_first_name_kanaが空では登録できないこと、全角文字のみ入力できる
    it "is invalid without a ship_first_name_kana" do
      user = build(:address, ship_first_name_kana: nil)
      user.valid?
      expect(user.errors[:ship_first_name_kana]).to include("を入力してください", "全角文字で入力してください")
    end

    # 18. ship_family_name_kanaが空では登録できないこと、全角文字のみ入力できる
    it "is invalid without a ship_family_name_kana" do
      user = build(:address, ship_family_name_kana: nil)
      user.valid?
      expect(user.errors[:ship_family_name_kana]).to include("を入力してください", "全角文字で入力してください")
    end

    # 19. post_codeが空では登録できないこと
    it "is invalid without a post_code" do
      user = build(:address, post_code: nil)
      user.valid?
      expect(user.errors[:post_code]).to include("を入力してください")
    end

    # 20. prefectureが空では登録できないこと
    it "is invalid without a prefecture" do
      user = build(:address, prefecture: nil)
      user.valid?
      expect(user.errors[:prefecture]).to include("を入力してください")
    end

    # 21. cityが空では登録できないこと
    it "is invalid without a city" do
      user = build(:address, city: nil)
      user.valid?
      expect(user.errors[:city]).to include("を入力してください")
    end

    # 22. block_numberが空では登録できないこと
    it "is invalid without a block_number" do
      user = build(:address, block_number: nil)
      user.valid?
      expect(user.errors[:block_number]).to include("を入力してください")
    end

    # 23. phone_numberが空では登録できないこと
    it "is invalid without a phone_number" do
      user = build(:address, phone_number: nil)
      user.valid?
      expect(user.errors[:phone_number]).to include("を入力してください")
    end
  end 
end