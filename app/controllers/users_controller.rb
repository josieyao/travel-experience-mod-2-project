class UsersController < ApplicationController

  def index
    @user = User.find(session[:current_user_id])
  end

  def show
    @user = User.find(session[:current_user_id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    redirect_to user_path(@user)
  end

  def edit
    @user = User.find(session[:current_user_id])
  end

  def update
    @user = User.find(session[:current_user_id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  def delete
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password_digest)
  end

end