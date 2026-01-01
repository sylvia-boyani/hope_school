class Level < ApplicationRecord
  has_many :class_rooms, dependent: :destroy
  has_many :grade_subjects, dependent: :destroy
  has_many :subjects, through: :grade_subjects
end
