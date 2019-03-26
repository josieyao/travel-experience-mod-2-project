class SessionsController < ApplicationController

  def new

  end

  def create
      @user = User.find_by(email: params[:email])
      if @user.authenticate(params[:password])
          session[:current_user_id] = @user.id
          redirect_to user_path(@user)
      end
  end

  def destroy
      reset_session
      redirect_to '/sessions/new'
  end


  def destroy
    session.delete :email
    @current_user = nil

    redirect_to new_session_path
  end
end
