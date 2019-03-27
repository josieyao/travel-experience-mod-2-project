class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.string :address
      t.string :description
      t.text :date
      t.text :time
      t.integer :itinerary_id

      t.timestamps
    end
  end
end
