require 'rails_helper'
# 注記：（商品名：name）、（商品情報：infomation）、（商品画像：images）、（商品価格：price）、（発送元地域：prefecture_id）、（商品の状態：condition）、（送料の負担：delivery_charge_id）、（発送日数：shipping_day_id）、（カテゴリー：category_id）
describe Product do
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
      expect(product.errors.full_messages).to include("商品名を入力してください")
    end

    # 3. infomationが空では登録できないこと
    it "is invalid without an infomation" do
      product = build(:product, infomation: nil)
      product.valid?
      expect(product.errors.full_messages).to include("商品の説明を入力してください")
    end

    # 4. infomationが300文字を超えたら登録できないこと
    it "is an infomation over 300 words" do
      product = build(:product)
      product.infomation = 'a' * 301
      expect(product).to_not be_valid
      expect(product.errors.full_messages).to include("商品の説明は300文字以内で入力してください")
    end

    # 5. imagesが空では登録できないこと
    it "is invalid without images" do
      product = build(:product)
      # 注記１：複数枚投稿しているため、［］を使うことで画像の配列をゼロにすることができる。
      # 注記２：product.images = nilではエラーになるため注意。
      product.images = []
      product.valid?
      expect(product.errors.full_messages).to include("商品画像を入力してください")
    end

    # 6. priceが空では登録できないこと、半角数字のみ入力できる
    it "is invalid without a price" do
      product = build(:product, price: nil)
      product.valid?
      expect(product.errors.full_messages).to include("商品価格を入力してください", "商品価格は300円以上にしてください")
      end

    # 7. priceが300円未満は登録できない
    it "is a price < 300" do
      product = build(:product, price: 299)
      product.valid?
      expect(product.errors.full_messages).to include("商品価格は300円以上にしてください")
    end

    # 8. prefecture_idが空では登録できないこと
    it "is invalid without a prefecture_id" do
      product = build(:product, prefecture_id: nil)
      product.valid?
      expect(product.errors.full_messages).to include("Prefectureを入力してください")
    end

    # 9. conditionが空では登録できないこと
    it "is invalid without a condition" do
      product = build(:product, condition_id: nil)
      product.valid?
      expect(product.errors.full_messages).to include("Conditionを入力してください")
    end

    # 10. delivery_charge_idが空では登録できないこと
    it "is invalid without a delivery_charge_id" do
      product = build(:product, delivery_charge_id: nil)
      product.valid?
      expect(product.errors.full_messages).to include("Delivery chargeを入力してください")
    end

    # 1 . shipping_day_idが空では登録できないこと
    it "is invalid without a shipping_day_id" do
      product = build(:product, shipping_day_id: nil)
      product.valid?
      expect(product.errors.full_messages).to include("Shipping dayを入力してください")
    end

    # 12. category_idが空では登録できないこと
    it "is invalid without a category_id" do
      product = build(:product, category_id: nil)
      product.valid?
      expect(product.errors.full_messages).to include("Categoryを入力してください")
    end
  end
end