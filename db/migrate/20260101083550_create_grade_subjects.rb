class CreateGradeSubjects < ActiveRecord::Migration[8.1]
  def change
    create_table :grade_subjects do |t|
      t.references :level, null: false, foreign_key: true
      t.references :subject, null: false, foreign_key: true

      t.timestamps
    end
  end
end
