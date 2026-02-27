class Student < ApplicationRecord
  belongs_to :class_room
  has_many :assessments, dependent: :destroy

  has_one_attached :photo

  validates :first_name, :last_name, :admission_number, presence: true

  def name
    "#{first_name} #{last_name}"
  end

  # Safe thumbnail
  def photo_thumbnail
    if photo.attached? && photo.variable?
      # Only process variant if photo is attached and supports variants
      photo.variant(
        resize_to_fill: [400, 400],
        convert: 'jpg',
        saver: { quality: 80 }
      )
    else
      # Fallback to generated avatar URL if no photo
      "https://ui-avatars.com/api/?name=#{first_name}+#{last_name}&background=f5f5f4&color=a8a29e"
    end
  end
end