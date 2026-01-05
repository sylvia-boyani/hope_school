class Subject < ApplicationRecord
  has_many :grade_subjects, dependent: :destroy
  has_many :levels, through: :grade_subjects
  belongs_to :level 

  validates :level_id, presence: true
  validates :name, presence: true
end
