class Student < ApplicationRecord
  belongs_to :class_room, optional: true
  belongs_to :level
  has_many :assessments, dependent: :destroy

  validates :name, :admission_number, presence: true
  has_one_attached :photo

  def name
    "#{first_name} #{last_name}"
  end
end
