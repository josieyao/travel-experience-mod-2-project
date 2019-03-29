class EventReceiversController < ApplicationController
  def index
    @event_receivers = EventReceiver.all
    @user = User.find(session[:current_user_id])
    # @event = Event.find(params[:id])
  end

  def show
    @event_receiver = EventReceiver.find(session[:current_event_receiver_id])
  end

  def new
    @event_receiver = EventReceiver.new
  end

  def create
    @event_receiver = EventReceiver.create(event_receiver_params)
    redirect_to event_receiver_path(@event_receiver)
  end

  def edit
    @event_receiver = EventReceiver.find(session[:current_event_receiver_id])
  end

  def update
    @event_receiver = EventReceiver.find(session[:current_event_receiver_id])
    @event_receiver.update(event_receiver_params)
    redirect_to event_receiver_path(@event_receiver)
  end

  def delete
  end

  private

  def event_receiver_params
    params.require(:event_receiver).permit(:event_id, :receiver_id)
  end
end
