class TeachingAssignment < ApplicationRecord
  belongs_to :teacher
  belongs_to :class_room
  belongs_to :subject
end
