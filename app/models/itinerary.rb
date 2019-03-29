class Itinerary < ApplicationRecord
  belongs_to :user, required: false
  belongs_to :receiver, required: false
  has_many :bookings
  has_many :events, through: :bookings

  validates :destination_name, :destination_address, :airline, :flight_number, :gate_number, :seat_number, :departure_airport_code, :departure_date, :departure_flight_time, :return_airport_code, :return_date, :return_flight_time, presence: true

  def receiver_events
    self.receiver.events
  end

end
