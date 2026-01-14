class Subject < ApplicationRecord
  has_many :grade_subjects, dependent: :destroy
  has_many :levels, through: :grade_subjects
  has_many :courses, dependent: :destroy
  has_many :levels, through: :courses

  validates :name, presence: true
end
