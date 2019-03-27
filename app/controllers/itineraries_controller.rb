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
    @receiver = @itinerary.receiver
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
    params.require(:itinerary).permit(:destination_name, :destination_address, :airline, :airport_code, :flight_number, :gate_number, :seat_number, :departure_date, :return_date, :user_id, :receiver_id)
  end

end
