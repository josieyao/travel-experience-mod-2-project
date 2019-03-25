class CreateItineraries < ActiveRecord::Migration[5.2]
  def change
    create_table :itineraries do |t|
      t.string :destination_name
      t.string :destination_address
      t.string :airline
      t.string :airport_code
      t.integer :flight_number
      t.string :gate_number
      t.string :seat_number
      t.text :date
      t.integer :user_id
      t.integer :receiver_id

      t.timestamps
    end
  end
end
