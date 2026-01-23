class AddDetailsToAssessments < ActiveRecord::Migration[8.1]
  def change
    add_column :assessments, :performance_level, :string
    add_column :assessments, :assessment_date, :date
  end
end
