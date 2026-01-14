class Assessment < ApplicationRecord
  belongs_to :student
  belongs_to :subject
  belongs_to :level

  # CBC Performance Levels
  PERFORMANCE_LEVELS = [
    ['Exceeding Expectations (EE)', 'EE'],
    ['Meeting Expectations (ME)', 'ME'],
    ['Approaching Expectations (AE)', 'AE'],
    ['Below Expectations (BE)', 'BE']
  ]
end
