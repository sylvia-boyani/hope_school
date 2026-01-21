require "test_helper"

class ClassRoomTest < ActiveSupport::TestCase
  setup do
    @class_room = class_rooms(:grade1_red)
  end

  test "should be valid" do
    assert @class_room.valid?
  end

  test "should belong to a level" do
    assert_not_nil @class_room.level
    assert_equal "Grade 1", @class_room.level.name
  end

  test "should have students" do
    # This works because we linked 'jane' to 'grade1_red' in fixtures
    assert @class_room.students.count > 0
    assert_includes @class_room.students, students(:jane)
  end

  test "should have teachers through assignments" do
    # This works if you have an entry in teaching_assignments.yml
    assert_includes @class_room.teachers, teachers(:teacher_one)
  end

  test "invalid without stream" do 
    @class_room.stream = nil       
    assert_not @class_room.valid?
  end
end
