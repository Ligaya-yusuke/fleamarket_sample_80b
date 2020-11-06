class ItemsController < ApplicationController

  def index
    @products = Product.page(params[:page]).reverse_order.per(5)
  end

  def show

  end

end
