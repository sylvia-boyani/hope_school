require "test_helper"

class TeacherTest < ActiveSupport::TestCase
  test "valid teacher with required fields" do
    teacher = Teacher.new(
      first_name: "Jane",
      last_name: "Doe",
      email: "jane.doe@example.com"
    )
    assert teacher.valid?
  end

  test "invalid without first_name" do
    teacher = Teacher.new(
      last_name: "Doe",
      email: "jane2@example.com"
    )
    assert_not teacher.valid?
  end

  test "invalid without email" do
    teacher = Teacher.new(
      first_name: "Jane",
      last_name: "Doe"
    )
    assert_not teacher.valid?
  end
end
