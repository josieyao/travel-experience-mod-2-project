class ItinerariesController < ApplicationController

  def index

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

  def send_receiver_email
    itinerary = Itinerary.find(params[:id])
    path = itinerary_url(itinerary)
    mail = Mail.new do
      from     'do_not_reply@xperienc.com'
      to       'zepher2211@gmail.com'
      subject  'Someone Sent You a Present!'
      body     "Congratulations! #{@current_user.to_s} has paid all expenses for a trip to #{itinerary.destination}. Following is the link containing all of the information in regards to your trip: #{path}. Over the period of your trip you will receive emails in regard to the events that have been scheduled for you. Stay tuned!"
    end

    mail.delivery_method :sendmail

    mail.deliver
  end

  def send_mail
    @itinerary = Itinerary.find(params[:id])
    send_receiver_email
    redirect_to itinerary_path(@itinerary)
  end

  private

  def itinerary_params
    params.require(:itinerary).permit(:destination_name, :destination_address, :airline, :flight_number, :gate_number, :seat_number, :departure_airport_code, :departure_date, :departure_flight_time, :return_airport_code, :return_date, :return_flight_time, :user_id, :receiver_id)
  end

end
