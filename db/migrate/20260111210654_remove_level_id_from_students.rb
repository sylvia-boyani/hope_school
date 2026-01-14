class RemoveLevelIdFromStudents < ActiveRecord::Migration[8.1]
  def change
    remove_column :students, :level_id, :bigint
  end
end
