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
    @user = User.find(session[:current_user_id])
  end

  def create
    @itinerary = Itinerary.create(itinerary_params)
    @itinerary.update(user_id: session[:current_user_id])
    @user = User.find(session[:current_user_id])
      redirect_to user_path(@user)
  end

  def edit
    @itinerary = Itinerary.find(params[:id])
    @user = User.find(session[:current_user_id])
  end

  def update
    @itinerary = Itinerary.find(params[:id])
    @itinerary.update(itinerary_params)
    redirect_to itinerary_path(@itinerary)
  end

  def destroy
    @user = User.find(session[:current_user_id])
    @itinerary = Itinerary.find(params[:id])
    @itinerary.destroy
    redirect_to user_path(@user)
  end

  private

  def itinerary_params
    params.require(:itinerary).permit(:destination_name, :destination_address, :airline, :flight_number, :gate_number, :seat_number, :departure_airport_code, :departure_date, :departure_flight_time, :return_airport_code, :return_date, :return_flight_time, :user_id, :receiver_id)
  end

end
