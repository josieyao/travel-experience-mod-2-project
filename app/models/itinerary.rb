class Itinerary < ApplicationRecord
  belongs_to :user, required: false
  belongs_to :receiver, required: false
  has_many :bookings
  has_many :events, through: :bookings

  validates :destination_name, :destination_address, :airline, :flight_number, :gate_number, :seat_number, :departure_airport_code, :departure_date, :departure_flight_time, :return_airport_code, :return_date, :return_flight_time, presence: true

  def surprise_message
    "Surprise! You are going to " + self.destination_name + " from " + self.departure_date + "-" + self.return_date + "!"
  end


  def departure_flight_info
    puts "Airline: " + self.airline
    puts "Flight Number: " + self.flight_number
    puts "Gate Number: " + self.gate_number
    puts "Seat Number: " + self.seat_number
    puts "Airport Code: " + self.departure_airport_code
    puts "Departure Date: " + self.departure_date
    puts "Departure Flight Time: " + self.departure_flight_time
  end

  def return_flight_info
    puts "Airline: " + self.airline
    puts "Flight Number: " + self.flight_number
    puts "Gate Number: " + self.gate_number
    puts "Seat Number: " + self.seat_number
    puts "Airport Code: " + self.return_airport_code
    puts "Return Date: " + self.return_date
    puts "Return Flight Time: " + self.return_flight_time
  end

  def all_destinations
    self.destination_names
  end

  def alphabetized_itinerary_names
    self.destination_names.sort
  end

  def alphabetized_airlines
    self.airlines.sort
  end

  def total_number_of_itineraries
    self.length
  end


end
