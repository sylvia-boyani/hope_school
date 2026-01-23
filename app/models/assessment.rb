class Assessment < ApplicationRecord
  belongs_to :student
  belongs_to :subject
  belongs_to :level

  # This is for your views/dropdowns
  PERFORMANCE_LEVELS = [
    ['Exceeding Expectations (EE)', 'EE'],
    ['Meeting Expectations (ME)', 'ME'],
    ['Approaching Expectations (AE)', 'AE'],
    ['Below Expectations (BE)', 'BE']
  ]

  # This extracts just the codes: ["EE", "ME", "AE", "BE"]
  VALID_LEVELS = PERFORMANCE_LEVELS.map { |display, code| code }

  # Update validation to use the extracted codes
  validates :performance_level, inclusion: { in: VALID_LEVELS }
  validates :assessment_date, presence: true
end