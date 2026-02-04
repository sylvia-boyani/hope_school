class AddDetailsToAdmissions < ActiveRecord::Migration[8.1]
  def change
    add_column :admissions, :first_name, :string
    add_column :admissions, :last_name, :string
    add_column :admissions, :admission_number, :string
    add_column :admissions, :level_id, :integer
    add_column :admissions, :date_of_birth, :date
    add_column :admissions, :gender, :string
  end
end
