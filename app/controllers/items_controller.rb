class ItemsController < ApplicationController

  def index
    array = []
    @products = Product.all.order(created_at: :desc)
    @products.each do |item|
      #コメントアウトは変更の可能性があるため残しています。
      # unless item.buyer_id.present?
      array << item
      # end
    end
    @items = Kaminari.paginate_array(array).page(params[:page]).per(15)
    @pickup_items = @items.per(5)
    respond_to do |format|
      format.html
      format.js
    end
  end

  def show

  end

end
