class RemoveSubjectFromTeachers < ActiveRecord::Migration[8.1]
  def change
    remove_reference :teachers, :subject, foreign_key: true
  end
end
