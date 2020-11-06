class CategoriesController < ApplicationController
  
  def index
    @categories = Category.where(ancestry: nil).order("id ASC")
  end

  def show
    @category = Category.find(params[:id])
    @products = Product.all
  end
end
