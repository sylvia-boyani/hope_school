class TeachingAssignment < ApplicationRecord
  belongs_to :teacher
  belongs_to :class_room
  belongs_to :subject

  validates :teacher_id, :class_room_id, :subject_id, presence: true
  # Optional: Prevent assigning the same teacher to the same subject in the same room twice
  validates :teacher_id, uniqueness: { scope: [:class_room_id, :subject_id], message: "is already assigned to this subject in this class" }
end