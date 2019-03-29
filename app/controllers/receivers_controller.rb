class ReceiversController < ApplicationController

  def index
    @receiver = Receiver.find(params[:id])
  end

  def show
    @receiver = Receiver.find(params[:id])
  end

  def new
    @receiver = Receiver.new
  end

  def create
    @receiver = Receiver.create(receiver_params)
    @user = User.find(session[:current_user_id])
    Friendship.create(user_id: @user.id, receiver_id: @receiver.id)
    redirect_to receiver_path(@receiver)
  end

  def edit
    @receiver = Receiver.find(params[:id])
  end

  def update
    @receiver = Receiver.find(params[:id])
    @receiver.update(receiver_params)
    redirect_to receiver_path(@receiver)
  end

  def delete
  end

  private

  def receiver_params
    params.require(:receiver).permit(:first_name, :last_name, :email, user_ids: [])
  end

end
