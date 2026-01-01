class CreateAssessments < ActiveRecord::Migration[8.1]
  def change
    create_table :assessments do |t|
      t.references :student, null: false, foreign_key: true
      t.references :grade_subject, null: false, foreign_key: true
      t.decimal :score
      t.integer :term

      t.timestamps
    end
  end
end
