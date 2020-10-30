FactoryBot.define do
  factory :address do
    ship_first_name          {"佐藤"}
    ship_family_name         {"佐藤"}
    ship_first_name_kana    {"サトウ"}
    ship_family_name_kana     {"サトウ"}
    post_code            {"00000000"}
    prefecture            {"東京都"}
    city            {"渋谷区"}
    block_number            {"1-1"}
    building_number            {""}
    phone_number            {"00000000"}

  end
end