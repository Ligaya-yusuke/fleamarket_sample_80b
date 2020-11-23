FactoryBot.define do
  factory :product do
    # 注記：（商品名：name）、（商品情報：infomation）、（商品画像：images）、（商品価格：price）、（発送元地域：prefecture_id）、（商品の状態：condition）、（送料の負担：delivery_charge_id）、（発送日数：shipping_day_id）、（カテゴリー：category_id）
    name          {"佐藤"}
    infomation          {"佐藤"}
    images         {""}
    price    {299}
    prefecture_id     {1}
    condition     {1}
    delivery_charge_id     {1}
    shipping_day_id     {1}
    category_id            {4}
  end
end