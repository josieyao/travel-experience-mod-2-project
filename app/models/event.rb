class Event < ApplicationRecord
  has_many :event_receivers
  has_many :receivers, through: :event_receivers
  belongs_to :itinerary, required: false


  validates :name, :address, :description, :time, presence: true

  validates_format_of :date, :with => /\d{4}\/\d{2}\/\d{2}/, :message => "Date must be in the following format: yyyy/mm/dd"
  def d_t
    self.date + " " + self.time
  end
end
