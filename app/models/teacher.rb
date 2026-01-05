class Teacher < ApplicationRecord
  belongs_to :subject, optional: true
  has_many :teaching_assignments, dependent: :destroy
  has_many :class_rooms, through: :teaching_assignments
  validates :name, :email, presence: true
end
