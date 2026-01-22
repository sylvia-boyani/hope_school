require "test_helper"

class TeachingAssignmentTest < ActiveSupport::TestCase
  setup do
    @assignment = teaching_assignments(:math_assignment)
  end

  test "should be valid" do
    assert @assignment.valid?
  end

  test "should belong to a teacher" do
    assert_equal teachers(:teacher_one), @assignment.teacher
  end

  test "should belong to a class_room" do
    assert_equal class_rooms(:grade1_red), @assignment.class_room
  end

  test "should belong to a subject" do
    assert_equal subjects(:math), @assignment.subject
  end

  test "invalid without teacher" do
    @assignment.teacher = nil
    assert_not @assignment.valid?
  end

  test "should not allow duplicate assignments" do
    duplicate = @assignment.dup
    assert_not duplicate.valid?, "Should not allow the same teacher/subject/class combo"
  end
end