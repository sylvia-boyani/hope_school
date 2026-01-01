class GradeSubject < ApplicationRecord
  belongs_to :level
  belongs_to :subject

  has_many :assessments
end
