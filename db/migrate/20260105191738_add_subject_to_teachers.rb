class AddSubjectToTeachers < ActiveRecord::Migration[8.1]
  def change
    add_reference :teachers, :subject, null: false, foreign_key: true
  end
end
