class ItinerariesController < ApplicationController

  def index
    @itinerary = Itinerary.find(params[:id])
  end

  def show
    @itinerary = Itinerary.find(params[:id])
    session[:current_itinerary_id] = @itinerary.id
    @user = User.find(session[:current_user_id])
    @receiver = @itinerary.receiver
  end

  def new
    @itinerary = Itinerary.new
  end

  def create
    @itinerary = Itinerary.create(itinerary_params)
    @itinerary.update(user_id: session[:current_user_id])
    @receiver = @itinerary.receiver
    session[:current_itinerary_id] = @itinerary.id
    redirect_to new_receiver_path(@receiver)
  end

  def edit
    @itinerary = Itinerary.find(params[:id])
    @receiver = @itinerary.receiver
  end

  def update
    @itinerary = Itinerary.find(params[:id])
    @itinerary.update(itinerary_params)
    redirect_to itinerary_path(@itinerary)
  end

  def destroy

  end

  private

  def itinerary_params
    params.require(:itinerary).permit(:destination_name, :destination_address, :airline, :flight_number, :gate_number, :seat_number, :departure_airport_code, :departure_date, :departure_flight_time, :return_airport_code, :return_date, :return_flight_time, :user_id, :receiver_id)
  end

end
