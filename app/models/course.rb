class Course < ApplicationRecord
  belongs_to :level
  belongs_to :subject
end
