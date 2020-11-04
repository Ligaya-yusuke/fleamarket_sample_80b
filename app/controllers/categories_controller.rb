class CategoriesController < ApplicationController
  
  def index
    @categories = Category.where(ancestry: nil).order("id ASC").limit(13)
  end

  def show
    @category = Category.find(params[:id])
    @products = Product.all
  end
end
