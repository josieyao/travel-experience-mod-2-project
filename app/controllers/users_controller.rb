class UsersController < ApplicationController

  def index
    @user = User.find(session[:current_user_id])
  end

end
