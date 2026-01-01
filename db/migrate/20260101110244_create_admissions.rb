class CreateAdmissions < ActiveRecord::Migration[8.1]
  def change
    create_table :admissions do |t|
      t.references :student, null: false, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
