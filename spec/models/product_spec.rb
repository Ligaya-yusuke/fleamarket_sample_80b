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
    it "is invalid without images" do
      product = build(:product, images: nil)
      product.valid?
      expect(product.errors[:images]).to include("が選択されていません。")
    end

    # 5. priceが空では登録できないこと、半角数字のみ入力できる
    it "is invalid without a price" do
      product = build(:product, price: nil)
      product.valid?
      expect(product.errors[:price]).to include("が入力されていません。", "半角数字で入力してください")
    end

    # 5. priceが300円以上なら登録できること
    it "is a price <= 300" do
      product = build(:product, price: 299)
      product.valid?
      expect(product.errors[:price]).to include("は300円以上にしてください")
    end

    # 6. prefecture_idが空では登録できないこと
    it "is invalid without a prefecture_id" do
      product = build(:product, prefecture_id: nil)
      product.valid?
      expect(product.errors[:prefecture_id]).to include("が選択されていません。")
    end

    # 7. conditionが空では登録できないこと
    it "is invalid without a condition" do
      product = build(:product, condition: nil)
      product.valid?
      expect(product.errors[:condition]).to include("が選択されていません。")
    end

    # 8. delivery_charge_idが空では登録できないこと
    it "is invalid without a delivery_charge_id" do
      product = build(:product, delivery_charge_id: nil)
      product.valid?
      expect(product.errors[:delivery_charge_id]).to include("が選択されていません。")
    end

    # 9. shipping_day_idが空では登録できないこと
    it "is invalid without a shipping_day_id" do
      product = build(:product, shipping_day_id: nil)
      product.valid?
      expect(product.errors[:shipping_day_id]).to include("が選択されていません。")
    end

    # 10. category_idが空では登録できないこと
    it "is invalid without a category_id" do
      product = build(:product, category_id: nil)
      product.valid?
      expect(product.errors[:category_id]).to include("が選択されていません。")
    end
  end
end