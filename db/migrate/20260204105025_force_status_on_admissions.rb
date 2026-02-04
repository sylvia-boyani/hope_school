class ForceStatusOnAdmissions < ActiveRecord::Migration[8.1]
  def change
    # 1. Update any existing empty statuses to 'pending'
    Admission.where(status: nil).update_all(status: 'pending')

    # 2. Change the column so it cannot be null and has a default
    change_column_null :admissions, :status, false
    change_column_default :admissions, :status, from: nil, to: 'pending'
  end
end
