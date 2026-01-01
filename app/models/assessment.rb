class Assessment < ApplicationRecord
  belongs_to :student
  belongs_to :grade_subject

  validates :score, presence: true
  validates :term, inclusion: { in: [ 1, 2, 3 ] }
end
