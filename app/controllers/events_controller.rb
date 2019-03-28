class EventsController < ApplicationController
  def index
    @event = Event.find(session[:current_event_id])
  end

  def show
    @event = Event.find(params[:id])
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
    @event = Event.find(session[:current_event_id])
  end

  def update
    @event = Event.find(session[:current_event_id])
    @event.update(event_params)
    redirect_to event_path(@event)
  end

  def delete
  end

  private

  def event_params
    params.require(:event).permit(:name, :address, :description, :date, :time, :itinerary_id)
  end
end
