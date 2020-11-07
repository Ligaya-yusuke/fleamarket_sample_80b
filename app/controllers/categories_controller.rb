class CategoriesController < ApplicationController
  
  def index
    @categories = Category.where(ancestry: nil).order("id ASC")
  end

  def show
    @category = Category.find(params[:id])
    array = []
    @products = Product.all.order(created_at: :desc)
    @products.each do |item|
      if Category.find(item.category_id) == @category || Category.find(item.category_id).parent == @category || Category.find(item.category_id).parent.parent == @category
        array << item
      end
    end
      @items = Kaminari.paginate_array(array).page(params[:page]).per(5)
        respond_to do |format|
          format.html
          format.js
        end
  end
end
