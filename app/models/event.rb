class Event < ApplicationRecord
  has_many :event_receivers
  has_many :event_users
  has_many :bookings
  has_many :users, through: :event_users
  has_many :receivers, through: :event_receivers
  has_many :itineraries, through: :bookings


  validates :name, :address, :description, :time, presence: true

  def d_t
    self.date + " " + self.time
  end

  def correct_user?(params)
    if self.user_id == params.to_i
      return true
    end
  end

  def number_of_bookings
    self.bookings.count
  end

  def average_rating
    ratings = self.event_receivers.pluck(:rating)
    ratings.sum / ratings.length
  end

  def alphabetized_event_names
    self.names.sort
  end

  def highest_rating
    self.ratings.max
  end

  def lowest_rating
    self.ratings.min
  end

end
