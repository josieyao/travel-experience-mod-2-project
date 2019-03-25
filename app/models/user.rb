class User < ApplicationRecord
  has_many :itineraries
  has_many :receivers, through: :itineraries

  has_secure_password
end
