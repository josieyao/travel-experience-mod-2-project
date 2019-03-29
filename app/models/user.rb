class User < ApplicationRecord
  has_many :itineraries
  has_many :event_users
  has_many :events, through: :event_users
  has_many :friendships
  has_many :receivers, through: :friendships

  validates :first_name, :last_name, presence: true, length: { maximum: 50 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, uniqueness: true, presence: true, format: { with: VALID_EMAIL_REGEX }

  validates :password, presence: true, length: { minimum: 5 }

  has_secure_password

  def to_s
    self.first_name + " " + self.last_name
  end

  def stolen_identity?(params)
    if self.id == params.to_i
      return true
    end
  end

  def my_itineraries
    self.itineraries
  end

  def itinerary_count
    self.itineraries.length
  end

  def friendship_count
    self.friendships.length
  end

  def receiver_count
    self.receivers.length
  end

end
