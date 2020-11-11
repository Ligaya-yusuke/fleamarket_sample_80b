class PurchaseController < ApplicationController
  before_action :products_infomation, only:[:index]
  def index
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
