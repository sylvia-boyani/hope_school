class CreateAssessments < ActiveRecord::Migration[8.1]
  def change
    drop_table :assessments, if_exists: true

    create_table :assessments do |t|
      t.references :student, null: false, foreign_key: true
      t.references :subject, null: false, foreign_key: true
      t.references :level, null: false, foreign_key: true
      t.string :term
      t.integer :academic_year
      t.string :status

      t.timestamps
    end
  end
end
