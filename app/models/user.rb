class User < ApplicationRecord
  has_many :itineraries
  has_many :receivers, through: :itineraries

  validates :first_name, :last_name, presence: true
  validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, length: { minimum: 5}
  
  has_secure_password

end