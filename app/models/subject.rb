class Subject < ApplicationRecord
  has_many :grade_subjects, dependent: :destroy
  has_many :levels, through: :grade_subjects
end
