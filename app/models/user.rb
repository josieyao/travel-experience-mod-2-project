class User < ApplicationRecord
  has_many :itineraries
  has_many :receivers, through: :itineraries

  validates :first_name, :last_name, presence: true, length: { maximum: 50 }
  validates :email, uniqueness: true, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true, length: { minimum: 5 }

  has_secure_password

  def to_s
    self.first_name + " " + self.last_name
  end

end
