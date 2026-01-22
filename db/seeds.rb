puts "Seeding Levels..."

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

levels.each do |l|
  Level.find_or_create_by!(name: l[:name]) do |level|
    level.order = l[:order]
  end
end

puts "Done seeding Levels."
puts "---------------------"

# --------------------------------------------------

puts "Seeding ClassRooms (Red & Blue streams)..."

streams = ["Red", "Blue"]

Level.find_each do |level|
  streams.each do |stream|
    ClassRoom.find_or_create_by!(
      stream: "#{level.name} #{stream}",
      level: level
    )
  end
end

puts "Done seeding ClassRooms."
puts "---------------------"

# --------------------------------------------------

puts "Seeding CBC Subjects..."

cbc_subjects = [
  # Pre-Primary & Lower Primary
  { name: "Mathematics", code: "MATH" },
  { name: "English", code: "ENG" },
  { name: "Kiswahili", code: "KIS" },
  { name: "Environmental Activities", code: "ENV" },
  { name: "Creative Arts", code: "CREA" },
  { name: "Physical Education", code: "PE" },
  { name: "Religious Education", code: "RE" },

  # Upper Primary additions
  { name: "Science and Technology", code: "SCI" },
  { name: "Agriculture", code: "AGR" },
  { name: "Social Studies", code: "SST" },
  { name: "Life Skills", code: "LIFE" },
  { name: "Home Science", code: "HOME" },
  { name: "Computer Studies", code: "COMP" },
  { name: "Music", code: "MUS" },
  { name: "Art and Craft", code: "ART" },

  # Junior Secondary (JSS)
  { name: "Integrated Science", code: "ISCI" },
  { name: "Business Studies", code: "BUS" },
  { name: "Pre-Technical Studies", code: "TECH" },
  { name: "Health Education", code: "HE" },
  { name: "Social Sciences", code: "SSCI" },
  { name: "Visual Arts", code: "VART" },
  { name: "Performing Arts", code: "PART" },
  { name: "Sports and Physical Education", code: "SPE" }
]

cbc_subjects.each do |s|
  Subject.find_or_create_by!(code: s[:code]) do |subject|
    subject.name = s[:name]
  end
end

puts "Done seeding CBC Subjects."
puts "---------------------"
puts "Database seeding complete!"