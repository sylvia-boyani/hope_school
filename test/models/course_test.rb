require "test_helper"

class CourseTest < ActiveSupport::TestCase
  setup do
    @course = courses(:math_grade_1)
  end

  test "should be valid" do
    assert @course.valid?
  end

  test "belongs to a level" do
    assert_equal levels(:grade_1), @course.level
  end

  test "belongs to a subject" do
    assert_equal subjects(:math), @course.subject
  end
end