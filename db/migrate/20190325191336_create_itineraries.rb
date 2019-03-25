class CreateItineraries < ActiveRecord::Migration[5.2]
  def change
    create_table :itineraries do |t|
      t.integer :flight_number
      t.string :airline
      t.string :seat_number
      t.text :date
      t.string :airport_name
      t.string :airport_address
      t.string :gate_number
      t.string :destination_name
      t.string :destination_address
      t.integer :user_id
      t.integer :receiver_id

      t.timestamps
    end
  end
end
