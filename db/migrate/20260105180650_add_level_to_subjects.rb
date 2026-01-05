class AddLevelToSubjects < ActiveRecord::Migration[8.1]
  def change
    add_reference :subjects, :level, null: true, foreign_key: true
  end
end
