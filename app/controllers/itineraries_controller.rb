class ItinerariesController < ApplicationController
  def index
    @itinerary = Itinerary.find(session[:current_itinerary_id])
  end

  def show
    @itinerary = Itinerary.find(session[:current_itinerary_id])
  end

  def new
    @itinerary = Itinerary.new
  end

  def create
    @itinerary = Itinerary.create(itinerary_params)
    redirect_to itinerary_path(@itinerary)
  end

  def edit
    @itinerary = Itinerary.find(session[:current_itinerary_id])
  end

  def update
    @itinerary = Itinerary.find(session[:current_itinerary_id])
    @itinerary.update(itinerary_params)
    redirect_to itinerary_path(@itinerary)
  end

  def delete
  end

  private

  def itinerary_params
    params.require(:itinerary).permit(:destination_name, :destination_address, :airline, :airport_code, :flight_number, :gate_number, :seat_number, :departure_date, :return_date, :user_id, :receiver_id)
  end
end
