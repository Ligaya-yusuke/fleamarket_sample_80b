class ProductsController < ApplicationController
  before_action :set_category, only: [:new, :create]
  # before_action :set_category, only: [:new, :edit, :create, :update, :destroy]
  # before_action :set_item, only: [:show, :edit, :update, :destroy, :purchase, :buy]
  
  def index
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.create(product_params)
    binding.pry
    if @product.save
      redirect_to root_path, notice: '商品を出品しました。'
    else
      render :new, alert: "商品登録に失敗しました"
    end
  end

  #jsonで親の名前で検索し、紐づく小カテゴリーの配列を取得
  def get_category_children
    @category_children = Category.find(params[:parent_name]).children
  end

  #jsonで子カテゴリーに紐づく孫カテゴリーの配列を取得
  def get_category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end

  private

  def product_params
    params.permit(:name,:infomation,:price,:condition,:delivery_charge,:prefecture_id,:shipping_day,:brand,:category_id)
    # require(:products).
  end
  
  def set_category  
    @category_parent_array = Category.where(ancestry: nil).limit(13)
  end

  def item_params
    params.require(:products).permit(:category_id )
  end
end
