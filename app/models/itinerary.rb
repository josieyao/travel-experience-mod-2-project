class Itinerary < ApplicationRecord
  belongs_to :user
  belongs_to :receiver

  validates :destination_name, :destination_address, :airline, :airport_code, :flight_number, :gate_number, :seat_number, presence: true

  validates_format_of :departure_date, :return_date, :with => /\d{4}\/\d{2}\/\d{2}/, :message => "Date must be in the following format: yyyy/mm/dd"

end
