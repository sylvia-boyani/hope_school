class Student < ApplicationRecord
  belongs_to :class_room
  has_many :assessments, dependent: :destroy
  
  # validates :name, : belongs_to :leveladmission_no, presence: true
  # validates :admission_no, uniqueness: true
end
