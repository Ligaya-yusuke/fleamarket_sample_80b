class SellsController < ApplicationController
  
  def index
  end

  def new
    @sells = Product.new
  end

  def create
    @sell = Product.create(product_params)
  end

  private
  
  def product_params
    params.permit(:name, :information, :brand, :condition, :delivery_charge, :prefecture_id, :shipping_day, :price)
  end
end
