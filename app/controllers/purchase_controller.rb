class PurchaseController < ApplicationController
  before_action :products_infomation, only:[:index]
  def index
  end

  private

  def products_infomation
    @product = Product.find(params[:product_id])
    @delivery_charge = DeliveryCharge.find(@product.delivery_charge_id)
    user = User.find(current_user.id)
    address = Address.find(user.id)
    prefcture = Prefecture.find(address.prefecture_id).name
    family = address.ship_family_name
    first = address.ship_first_name
    @post_code = address.post_code
    @address1 = prefcture + address.city + address.block_number
    @address2 = address.building_number
    @username = family + first
  end
end
