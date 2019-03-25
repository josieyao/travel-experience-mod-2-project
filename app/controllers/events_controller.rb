class EventsController < ApplicationController
  def index
    @event = Event.find(session[:current_event_id])
  end

  def show
    @event = Event.find(session[:current_event_id])
  end

  def new
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

  def event_params
    params.require(:event).permit(:name, :address, :description, :date, :time)
  end
end
