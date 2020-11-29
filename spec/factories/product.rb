FactoryBot.define do
  factory :product do
    # 注記：（商品名：name）、（商品情報：infomation）、（商品画像：images）、（商品価格：price）、（発送元地域：prefecture_id）、（商品の状態：condition）、（送料の負担：delivery_charge_id）、（発送日数：shipping_day_id）、（カテゴリー：category_id）
    name          {"佐藤"}
    infomation          {"佐藤"}
    price     {Faker::Number.between(from: 300, to: 9999999)}
    prefecture_id      {Faker::Number.between(from: 1, to: 48)}
    condition_id     {Faker::Number.between(from: 1, to: 6)}
    delivery_charge_id     {Faker::Number.between(from: 1, to: 2)}
    shipping_day_id     {Faker::Number.between(from: 1, to: 3)}
    category_id          {Faker::Number.between(from: 1, to: 1338)}
    user
    after(:build) { |product| product.images << create_list(:image, 1)}
  end
end