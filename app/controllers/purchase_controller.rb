class PurchaseController < ApplicationController
  before_action :products_infomation, only:[:index, :pay, :done]

  require 'payjp'
  def index
    #クレジットカードテーブルから顧客IDを検索
    credit_card = CreditCard.where(user_id: current_user.id).first
    if credit_card.blank?
      #登録された情報がない場合に登録画面に移動
      redirect_to controller: "credit_card", action: "new"
    else
      #保管した顧客IDでpayjpから情報取得
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      #保管したカードIDでpayjpから情報取得、カード情報表示のためインスタンス変数に代入
      customer = Payjp::Customer.retrieve(credit_card.customer_id)
      @default_card_information = customer.cards.retrieve(credit_card.card_id)
    end
  end

  def pay
    # @product = Product.find(params[:id]).first
    credit_card = CreditCard.where(user_id: current_user.id).first
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    Payjp::Charge.create(
      :amount => @product.price,
      :customer => credit_card.customer_id,
      :currency => 'jpy', 
    )
    redirect_to action: 'done'
  end

  def done
    credit_card = CreditCard.where(user_id: current_user.id).first
  end
  private

  def products_infomation
    @product = Product.find(params[:product_id])
    @delivery_charge = DeliveryCharge.find(@product.delivery_charge_id)
    address = current_user.address
    prefcture = Prefecture.find(address.prefecture_id).name
    @post_code = address.post_code
    @address = prefcture + address.city + address.block_number
    @buiding_number = address.building_number
    @user_name = address.ship_family_name + address.ship_first_name
  end
end
