class CreditCardController < ApplicationController

  require "payjp"

  def new
    # エラーが出たらマイグレーションファイルのuserのタイプをintegerにしてみる
    card = Credit_card.where(user_id: current_user.id)
    redirect_to action: "show" if credit_card.exists?
  end

  def pay
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    if params['payjp-token'].blank?
      redirect_to action: "new"
    else
      customer = Payjp::customer.create(
        description: '登録テスト',
        email: current_user.email,
        card: params['payjp-token'],
        metadata: {user_id: current_user.id}
      )
      @credit_card = Credit_card.new(user_id: current_user.id, customer_id: customer_id, credit_card_id: customer.default_card) 
      if @credit_card.save
        redirect_to action: "show"
      else
        redirect_to action: "pay"
      end
    end
  end

  def delete
    credit_card = Credit_card.where(user_id: current_user.id).first
    if credit_card.blank?
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(credit_card.customer_id)
      customer.delete
      credit_card.delete
    end
      redirect_to action: "new"
  end

  def show
    credit_card = Credit_card.where(user_id: current_user.id).first
    if credit_card.blank?
      redirect_to action: "new"
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(credit_card.customer_id)
      @default_card_information = customer.credit_card.retrieve(credit_card.credit_card_id)
    end
  end
end
