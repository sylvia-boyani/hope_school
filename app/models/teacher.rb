class Teacher < ApplicationRecord
  has_many :teaching_assignments, dependent: :destroy
  has_many :subjects, through: :teaching_assignments
  has_many :class_rooms, through: :teaching_assignments

  # This allows the teacher form to save assignments
  accepts_nested_attributes_for :teaching_assignments, allow_destroy: true, reject_if: :all_blank

  validates :first_name, :last_name, :email, presence: true

  def name
    "#{first_name} #{last_name}"
  end

  def grade_and_stream
  "#{level.name} - #{stream}"
  end
end