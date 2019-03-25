class Event < ApplicationRecord
  has_many :event_receivers
  has_many :receivers, through: :event_receivers
end
