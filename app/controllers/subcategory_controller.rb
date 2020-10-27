class SubcategoryController < ApplicationController
  def index
    @category = Category.where(ancestry: nil)
    # @subcategory = @category.children
  end

  def show
    @category = Category.find(params[:id])
  end
end
