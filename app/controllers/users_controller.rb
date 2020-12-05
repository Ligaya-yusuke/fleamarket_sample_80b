class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @item = Product.where(user_id: current_user.id)
    @item = @item.all.order(id: "DESC")
    @count = Product.where(user_id: current_user.id).count
  end


end
