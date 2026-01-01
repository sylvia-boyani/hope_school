class AddClassRoomToStudents < ActiveRecord::Migration[8.1]
  def change
    add_reference :students, :class_room, null: false, foreign_key: true
  end
end
