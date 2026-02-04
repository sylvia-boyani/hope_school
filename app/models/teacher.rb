class Teacher < ApplicationRecord
  has_many :teaching_assignments, dependent: :destroy, inverse_of: :teacher
  has_many :subjects, through: :teaching_assignments
  has_many :class_rooms, through: :teaching_assignments

  accepts_nested_attributes_for :teaching_assignments, allow_destroy: true, reject_if: :all_blank
  
  validates :first_name, :last_name, :email, presence: true

  def name
    "#{first_name} #{last_name}"
  end

  def assigned_classes
    class_rooms.map { |c| "#{c.level.name} - #{c.name}" }.join(", ")
  end
end