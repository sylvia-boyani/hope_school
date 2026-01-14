class Student < ApplicationRecord
  belongs_to :class_room
  has_many :assessments, dependent: :destroy

  has_one_attached :photo

  validates :first_name, :last_name, :admission_number, presence: true

  def name
    "#{first_name} #{last_name}"
  end

  def photo_thumbnail
    if photo.attached? && self.persisted?
      # saver: { subsampling: 0 } keeps the colors sharp
      photo.variant(
        resize_to_fill: [400, 400], 
        convert: 'jpg', 
        saver: { quality: 80 }
      ).processed
    else
      "https://ui-avatars.com/api/?name=#{first_name}+#{last_name}&background=f5f5f4&color=a8a29e"
    end
  end
end
