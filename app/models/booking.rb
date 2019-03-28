class Booking < ApplicationRecord
  belongs_to :itinerary
  belongs_to :event
end
