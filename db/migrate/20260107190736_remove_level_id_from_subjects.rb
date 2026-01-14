class RemoveLevelIdFromSubjects < ActiveRecord::Migration[8.1]
  def change
    remove_column :subjects, :level_id, :integer
  end
end
