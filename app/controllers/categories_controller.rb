class CategoriesController < ApplicationController
  
  def index
    @category = Category.where(ancestry: nil).order("id ASC").limit(13)
  end

  def show
    @category = Category.find(params[:id])
    @product = Product.all
  end
end
