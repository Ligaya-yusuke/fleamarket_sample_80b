class CategoriesController < ApplicationController
  # before_action :set_category, only: :show
  
  def index
    @category = Category.where(ancestry: nil).order("id ASC").limit(13)
  end

  def show
    # @category = @item.set_items
    # @category = @category.where(buyer_id: nil).order("created_at DESC")
    @category = Category.find(params[:id])
  end

  # def child_window
  #   @children = Category.find(params[:id]).children
  # end
  private
  # def set_category
  #   @item = Category.find(params[:id])
  # end
end
