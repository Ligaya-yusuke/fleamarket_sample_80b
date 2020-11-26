require 'rails_helper'

RSpec.describe CreditCard, type: :model do
  # 1. user_id, customer_id, card_idが存在すれば登録できること
  it "is valid with a user_id, customer_id, card_id" do
    credit_card = build(:credit_card)
    expect(credit_card).to be_valid
  end

  # 2. user_idがない場合は登録できないこと
  it "is invalid without a user_id" do
    credit_card = build(:credit_card, user_id: nil)
    credit_card.valid?
    expect(credit_card.errors[:user_id]).to include("を入力してください")
  end
  # 3. customer_idがない場合は登録できないこと
  it "is invalid without a customer_id" do
    credit_card = build(:credit_card, customer_id: nil)
    credit_card.valid?
    expect(credit_card.errors[:customer_id]).to include("を入力してください")
  end
  # 4. card_idがない場合は登録できないこと
  it "is invalid without a card_id" do
    credit_card = build(:credit_card, card_id: nil)
    credit_card.valid?
    expect(credit_card.errors[:card_id]).to include("を入力してください")
  end
end
