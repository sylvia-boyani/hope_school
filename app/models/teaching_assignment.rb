class TeachingAssignment < ApplicationRecord
  belongs_to :class_room
  belongs_to :subject
  belongs_to :teacher, inverse_of: :teaching_assignments

  # CHANGE THIS: Validate the association object, not the _id
  validates :teacher, :class_room, :subject, presence: true
  
  # Update your uniqueness validation to use the object as well
  validates :teacher, uniqueness: { 
    scope: [:class_room_id, :subject_id], 
    message: "is already assigned to this subject in this class" 
  }
end