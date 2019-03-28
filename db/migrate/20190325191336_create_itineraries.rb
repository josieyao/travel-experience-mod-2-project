class CreateItineraries < ActiveRecord::Migration[5.2]
  def change
    create_table :itineraries do |t|
      t.string :destination_name
      t.string :destination_address
      t.string :airline
      t.string :flight_number
      t.string :gate_number
      t.string :seat_number
      t.string :departure_airport_code
      t.string :departure_date
      t.string :departure_flight_time
      t.string :return_airport_code
      t.string :return_date
      t.string :return_flight_time
      t.belongs_to :user
      t.belongs_to :receiver

      t.timestamps
    end
  end
end
