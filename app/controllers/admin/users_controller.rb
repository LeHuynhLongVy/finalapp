class Admin::UsersController < ApplicationController
  def index
    @user=User.all.page(params[:page]).per(8)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(user_params)
    redirect_to admin_users_path
  end

  def destroy
    User.destroy(params[:id])
    redirect_to admin_users_path
  end

  def user_params
    params.require(:user).permit(:firstname, :lastname, :email, :password)
  end
end
