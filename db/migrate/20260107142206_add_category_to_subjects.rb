class AddCategoryToSubjects < ActiveRecord::Migration[8.1]
  def change
    add_column :subjects, :category, :string
  end
end
