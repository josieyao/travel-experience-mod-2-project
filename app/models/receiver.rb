class Receiver < ApplicationRecord
  has_many :itineraries
  has_many :users, through: :itineraries
  has_many :event_receivers
  has_many :events, through: :event_receivers

  validates :first_name, :last_name, presence: true
  validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  def to_s
    self.first_name + " " + self.last_name
  end

end
