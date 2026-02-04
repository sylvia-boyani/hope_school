class AllowNullStudentOnAdmissions < ActiveRecord::Migration[8.1]
  def change
    change_column_null :admissions, :student_id, true
  end
end
