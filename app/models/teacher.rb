class Teacher < ApplicationRecord
  has_many :teaching_assignments, dependent: :destroy
  has_many :class_rooms, through: :teaching_assignments
end
