class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @item = Product.where(user_id: current_user.id)
    @item = @item.all.order(id: "DESC")
    @item = @item.page(params[:page]).per(6)
    #  json形式にする時に使用
      respond_to do |format|
        format.html
        format.js
      end
    @count = Product.where(user_id: current_user.id).count
  end


end
