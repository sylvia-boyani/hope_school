class AddLevelToStudents < ActiveRecord::Migration[8.1]
  def change
    add_reference :students, :level, null: false, foreign_key: true
  end
end
