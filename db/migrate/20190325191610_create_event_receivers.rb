class CreateEventReceivers < ActiveRecord::Migration[5.2]
  def change
    create_table :event_receivers do |t|
      t.belongs_to :event
      t.belongs_to :receiver
      t.integer :rating

      t.timestamps
    end
  end
end
