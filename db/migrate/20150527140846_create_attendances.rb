class CreateAttendances < ActiveRecord::Migration
  def change
    create_table :attendances do |t|
      t.integer :attendee_id, index: true
      t.integer :attended_event_id, index: true

      t.timestamps null: false
    end
  end
end
