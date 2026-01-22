require "test_helper"

class SubjectTest < ActiveSupport::TestCase
  setup do
    @subject = subjects(:math)
  end

  test "should be valid" do
    assert @subject.valid?
  end

  test "name should be present" do
    @subject.name = ""
    assert_not @subject.valid?
  end

  test "code should be unique" do
    duplicate_subject = @subject.dup
    @subject.save
    assert_not duplicate_subject.valid?
  end

  test "should have many levels through courses" do
    # This verifies the Subject -> Course -> Level connection
    assert @subject.levels.include?(levels(:grade_1))
  end

  test "should have many teaching_assignments" do
    # Verifies that we can see which teachers are assigned to this subject
    assert_respond_to @subject, :teaching_assignments
  end
end