class EventsController < ApplicationController
  def index
    @events = Event.all
    @user = User.find(session[:current_user_id])
  end

  def show
    @event = Event.find(params[:id])
    @user = User.find(session[:current_user_id])
  end

  def new
    @itineraries = Itinerary.all
    @event = Event.new
  end

  def create
    @event = Event.create(event_params)
    redirect_to event_path(@event)
  end

  def edit
    @event = Event.find(params[:id])
    @user = User.find(session[:current_user_id])
    @itineraries = @user.itineraries
  end

  def update
    @event = Event.find(params[:id])
    @event.update(event_params)
    redirect_to event_path(@event)
  end

  def delete
  end

  private

  def event_params
    params.require(:event).permit(:name, :address, :description, :date, :time, :itinerary_id, :search)
  end
end
