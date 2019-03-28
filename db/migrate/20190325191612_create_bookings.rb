class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.belongs_to :itinerary
      t.belongs_to :event

      t.timestamps
    end
  end
end
