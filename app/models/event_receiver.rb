class EventReceiver < ApplicationRecord
  belongs_to :event
  belongs_to :receiver
end
