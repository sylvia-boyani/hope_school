class Admission < ApplicationRecord
  belongs_to :student, optional: true 
  belongs_to :level, optional: true
  belongs_to :class_room, optional: true
  has_one_attached :photo

  # Ensure status is always one of our allowed values
  validates :status, presence: true, inclusion: { in: %w[pending approved rejected] }

  # Automatically set status before validation on new records
  before_validation :assign_default_status, on: :create
  validates :first_name, :last_name, :admission_number, presence: true
  
  def student_name
    "#{first_name} #{last_name}".strip
  end

  # This makes Admission work exactly like your Student model
  def name
    student_name
  end

  # Handle old "school_class" calls from the dashboard
  def school_class
    class_room&.stream
  end

  def photo_thumbnail
    return nil unless photo.attached?
    
    if photo.variable?
      photo.variant(resize_to_fill: [400, 400], convert: 'jpg', saver: { quality: 80 }).processed
    else
      photo
    end
  end

  private

  def assign_default_status
    self.status = 'pending' if status.blank?
  end
end