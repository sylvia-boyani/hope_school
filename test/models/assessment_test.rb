require "test_helper"

class AssessmentTest < ActiveSupport::TestCase
  setup do
    @assessment = assessments(:math_term_1)
  end

 test "should be valid" do
    puts @assessment.errors.full_messages unless @assessment.valid?
    assert @assessment.valid?
  end

  test "belongs to student, subject, and level" do
    assert_equal students(:jane), @assessment.student
    assert_equal subjects(:math), @assessment.subject
    assert_equal levels(:grade_1), @assessment.level
  end

  # ... rest of your tests
end