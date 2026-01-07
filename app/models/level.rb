class Level < ApplicationRecord
  has_many :class_rooms, dependent: :destroy
  has_many :grade_subjects, dependent: :destroy
  has_many :courses, dependent: :destroy
  has_many :subjects, through: :courses

  validates :name, presence: true, uniqueness: true
end
