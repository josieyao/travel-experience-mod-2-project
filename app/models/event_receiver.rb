class EventReceiver < ApplicationRecord
  belongs_to :event
  belongs_to :receiver

  def number_of_all_ratings
    ratings = []
    ratings << self.rating
    ratings.length
  end


end
