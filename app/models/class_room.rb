class ClassRoom < ApplicationRecord
  belongs_to :level

  has_many :students
  has_many :teaching_assignments
  has_many :teachers, through: :teaching_assignments
end
