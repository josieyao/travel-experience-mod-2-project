class EventUsersController < ApplicationController

  def index
    @event_users = EventUser.all
    @user = User.find(session[:current_user_id])
  end

  def show
    @event_user = EventUser.find(params[:id])
  end

  def new
    @event_user = EventUser.new
  end

  def create
    @event_user = EventUser.create(event_user_params)
    redirect_to event_user_path(@event_user)
  end

  def edit
    @event_user = EventUser.find(params[:id])
  end

  def update
    @event_user = EventUser.find(params[:id])
    @event_user.update(event_user_params)
    redirect_to event_user_path(@event_user)
  end

  def delete
  end

  private

  def event_user_params
    params.require(:event_user).permit(:user_id, :event_user_id)
  end
end
