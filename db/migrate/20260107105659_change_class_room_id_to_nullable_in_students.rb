class ChangeClassRoomIdToNullableInStudents < ActiveRecord::Migration[8.1]
  def change
    change_column_null :students, :class_room_id, true
  end
end