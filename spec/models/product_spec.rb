require 'rails_helper'
# 注記：（商品名：name）、（商品情報：infomation）、（商品画像：images）、（商品価格：price）、（発送元地域：prefecture_id）、（商品の状態：condition）、（送料の負担：delivery_charge_id）、（発送日数：shipping_day_id）、（カテゴリー：category_id）
describe User do
  describe '#create' do
    # 1. name,infomation,images,price,prefecture_id,condition_id,delivery_charge_id,shipping_day_id,category_id が存在すれば登録できること
    it "is valid with a name,infomation,images,price,prefecture_id,condition_id,delivery_charge_id,shipping_day_id,category_id" do
      product = build(:product)
      expect(product).to be_valid
    end

    # 2. nameが空では登録できないこと
    it "is invalid without a name" do
      product = build(:product, name: nil)
      product.valid?
      expect(product.errors[:name]).to include("が入力されていません。")
    end

    # 3. infomationが空では登録できないこと
    it "is invalid without an infomation" do
      product = build(:product, infomation: nil)
      product.valid?
      expect(product.errors[:infomation]).to include("が入力されていません。")
    end

    # 4. imagesが空では登録できないこと
    it "is invalid without a images" do
      product = build(:product, images: nil)
      product.valid?
      expect(product.errors[:images]).to include("が選択されていません。")
    end

    # 5. priceが空では登録できないこと
    it "is invalid without a price" do
      product = build(:product, price: nil)
      product.valid?
      expect(product.errors[:price]).to include("が入力されていません。")
    end

    # # 6. 重複したemailが存在する場合登録できないこと
    # it "is invalid with a duplicate email address" do
    #   user = create(:user)
    #   another_user = build(:user, email: user.email)
    #   another_user.valid?
    #   expect(another_user.errors[:email]).to include("は既に使用されています。")
    # end

    # # 7. passwordが7文字以上であれば登録できること
    # it "is valid with a password that has more than 7 characters " do
    #   user = build(:user, encrypted_password: "0000000")
    #   expect(user).to be_valid
    # end

    # # 8. passwordが6文字以下であれば登録できないこと
    # it "is invalid with a password that has less than 5 characters " do
    #   user = build(:user, password: "000000")
    #   user.valid?
    #   expect(user.errors[:password]).to include("は7文字以上に設定して下さい。")
    # end

    # # 9. 重複したnicknameが存在する場合登録できないこと
    # it "is invalid with a duplicate nickname" do
    #   user = create(:user)
    #   another_user = build(:user, nickname: user.nickname)
    #   another_user.valid?
    #   expect(another_user.errors[:nickname]).to include("は既に使用されています。")
    # end
  end
end