require "test_helper"

class StudentTest < ActiveSupport::TestCase
  fixtures :levels, :class_rooms, :students
 def setup
    @level = Level.create!(name: "Grade 1")
    @class_room = ClassRoom.create!(level: @level, stream: "Red")
    @student = Student.new(
      first_name: "Jane", 
      last_name: "Doe", 
      admission_number: "1234", 
      class_room: @class_room
    )
  end

  test "should be valid with all fields" do
    assert @student.valid?
  end

  test "invalid without first name" do
    @student.first_name = nil
    assert_not @student.valid?
  end

  test "name method returns full name" do
    assert_equal "Jane Doe", @student.name
  end

  test "photo_thumbnail returns avatar URL when no photo attached" do
    assert_match /ui-avatars.com/, @student.photo_thumbnail
  end
end
