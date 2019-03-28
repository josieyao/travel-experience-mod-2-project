class User < ApplicationRecord
  has_many :itineraries
  has_many :event_selfs
  has_many :events, through: :event_selfs
  has_many :receivers, through: :itineraries

  validates :first_name, :last_name, presence: true, length: { maximum: 50 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, uniqueness: true, presence: true, format: { with: VALID_EMAIL_REGEX }

  validates :password, presence: true, length: { minimum: 5 }

  has_secure_password

  def to_s
    self.first_name + " " + self.last_name
  end

  def stolen_identity?(params)
    unless self.id == params.to_i
    end
  end


end
