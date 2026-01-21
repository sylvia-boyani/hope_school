require "test_helper"

class TeacherTest < ActiveSupport::TestCase
  setup do
    @teacher = teachers(:teacher_one)
  end

  test "should be valid" do
    assert @teacher.valid?
  end

  test "name method returns full name" do
    assert_equal "John Maina", @teacher.name
  end

  test "has associated subjects through assignments" do
    assert @teacher.subjects.include?(subjects(:math))
  end

  test "has associated class_rooms through assignments" do
    assert @teacher.class_rooms.include?(class_rooms(:grade1_red))
  end

  test "deleting teacher deletes their teaching assignments" do
    assert_difference "TeachingAssignment.count", -@teacher.teaching_assignments.count do
      @teacher.destroy
    end
  end
end