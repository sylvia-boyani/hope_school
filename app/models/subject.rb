class Subject < ApplicationRecord
  has_many :courses, dependent: :destroy
  has_many :levels, through: :courses
  has_many :teaching_assignments
  has_many :teachers, through: :teaching_assignments

  validates :name, presence: true, uniqueness: true
  validates :code, presence: true, uniqueness: true
end