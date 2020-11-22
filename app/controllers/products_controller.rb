class ProductsController < ApplicationController
  before_action :set_category, only: [:new, :create, :edit]
  before_action :set_product, only: [:show, :edit]
  before_action :move_to_signed_in, except: [:index, :show]
  # before_action :set_product, except: [:index, :new, :create]
  
  def index
    # Productテーブルとimagesデータを事前に読み込む
    @products = Product.includes(:images).order('created_at DESC')

  end

  def new
    @product = Product.new
    @product.images.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path , notice: "商品を出品しました。"
    else
      flash[:alert] = @product.errors.full_messages.join(',')
      redirect_to new_product_path
    end
  end

  def show
    @image_first = Image.where(product_id: @product).first.src.url
    @category = Category.find(@product.category_id)
    @user = User.find(@product.user_id)
    @address = Prefecture.find(@product.prefecture_id)
    @condition = Condition.find(@product.condition_id)
    @delivery_charge = DeliveryCharge.find(@product.delivery_charge_id)
    @shipping_day = ShippingDay.find(@product.shipping_day_id)
    array = []
    @products = Product.all.order(created_at: :desc)
    @products.each do |item|
      if Category.find(item.category_id).parent.parent == @category.parent.parent
        unless item.buyer_id.present?
        array << item
        end
      end
    end
    @items = Kaminari.paginate_array(array).page(params[:page]).per(5)
      respond_to do |format|
        format.html
        format.js
      end
  end

  def edit
    # 以下カテゴリー(ancestry)機能を編集ページに初期値として表示する為の記述
    @category_parent_array = []
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.category_name
    end
    @category_children_array = @product.category.parent.parent.children
    @category_grandchildren_array = @product.category.parent.children
  end

  def update
    if @produc.update(product_params)
        redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    product = Product.find(params[:id])
    if current_user.id == product.user_id
      product.destroy
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
    params.require(:product).permit(:name,:infomation,:price,:condition_id, :delivery_charge_id,:prefecture_id,:shipping_day_id,:brand,:category_id, images_attributes: [:src, :_destroy, :id]).merge(user_id: current_user.id)
  end
  
  def set_category  
    @category_parent_array = Category.where(ancestry: nil)
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def item_params
    params.permit(:category_id )
  end

  def move_to_signed_in
    unless user_signed_in?
      #サインインしていないユーザーはログインページが表示される
      redirect_to  new_user_session_path
    end
  end
end
