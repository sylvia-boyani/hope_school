class ClassRoom < ApplicationRecord
  belongs_to :level

  has_many :students
  has_many :teaching_assignments
  has_many :teachers, through: :teaching_assignments

  validates :stream, presence: true 
  validates :stream, uniqueness: { scope: :level_id }

  def grade_and_stream
    "#{level.name} - #{stream}"
  end
end
