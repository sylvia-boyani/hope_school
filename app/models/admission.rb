class Admission < ApplicationRecord
  belongs_to :student

  scope :pending, -> { where(status: "pending") }
  scope :recent,  -> { order(created_at: :desc).limit(5) }
end
