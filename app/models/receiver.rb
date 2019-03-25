class Receiver < ApplicationRecord
  has_many :itineraries
  has_many :users, through: :itineraries
  has_many :event_receivers
  has_many :events, through: :event_receivers
end
