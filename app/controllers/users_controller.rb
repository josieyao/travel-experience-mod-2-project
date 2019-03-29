class UsersController < ApplicationController

  #before_action :require_login

  def index
    @users = User.all
    @user = User.find(session[:current_user_id])
  end

  def show
    @user = User.find(session[:current_user_id])
    # unless @user.id == params[:id].to_i
    #   redirect_to user_path(@user)
    # end

    @identity = @user.stolen_identity?(params[:id])
    if !@identity
      redirect_to user_path(@user)
    end
  end

  def new
     @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.valid?
      @user.save
      redirect_to root_path
    else
      @user.errors.full_messages
      redirect_to new_user_path(@user)
    end
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

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

  #def require_login
  #  return head(:forbidden) unless session.include? :current_user_id
  #end

end
