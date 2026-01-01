class CreateClassRooms < ActiveRecord::Migration[8.1]
  def change
    create_table :class_rooms do |t|
      t.references :level, null: false, foreign_key: true
      t.string :stream

      t.timestamps
    end
  end
end
