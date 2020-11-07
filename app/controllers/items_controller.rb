class ItemsController < ApplicationController

  def index
    array = []
    @products = Product.all.order(created_at: :desc)
    @products.each do |item|
      unless item.buyer_id.present?
        array << item
      end
    end
      @items = Kaminari.paginate_array(array).page(params[:page]).per(5)
  end

  def show

  end

end
