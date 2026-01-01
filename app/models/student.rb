class Student < ApplicationRecord
  belongs_to :class_room
  has_many :assessments, dependent: :destroy
end
