class Receiver < ApplicationRecord
  has_many :itineraries
  has_many :users, through: :itineraries
  has_many :event_receivers
  has_many :events, through: :event_receivers

  validates :first_name, :last_name, presence: true

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, uniqueness: true, presence: true, format: { with: VALID_EMAIL_REGEX }

  def to_s
    self.first_name + " " + self.last_name
  end

end
