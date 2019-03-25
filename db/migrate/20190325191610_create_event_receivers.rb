class CreateEventReceivers < ActiveRecord::Migration[5.2]
  def change
    create_table :event_receivers do |t|
      t.integer :event_id
      t.integer :receiver_id

      t.timestamps
    end
  end
end
