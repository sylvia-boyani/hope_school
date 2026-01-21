# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
levels = [
  { name: "PP1", order: 1 },
  { name: "PP2", order: 2 },
  { name: "Grade 1", order: 3 },
  { name: "Grade 2", order: 4 },
  { name: "Grade 3", order: 5 },
  { name: "Grade 4", order: 6 },
  { name: "Grade 5", order: 7 },
  { name: "Grade 6", order: 8 },
  { name: "JSS 1", order: 9 },
  { name: "JSS 2", order: 10 },
  { name: "JSS 3", order: 11 }
]

levels.each { |l| Level.create!(l) }

subjects = %w[
  Mathematics
  English
  Kiswahili
  Science
  Social_Studies
  Creative_Arts
]

subjects.each do |s|
  Subject.create!(name: s.titleize, code: s[0..3].upcase)
end
