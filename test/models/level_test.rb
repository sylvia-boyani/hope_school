require "test_helper"

class LevelTest < ActiveSupport::TestCase
  setup do
    @level = levels(:grade_one)
  end

  test "should be valid" do
    assert @level.valid?
  end

  test "name should be present" do
    @level.name = ""
    assert_not @level.valid?
  end

  test "name should be unique" do
    duplicate_level = @level.dup
    assert_not duplicate_level.valid?
  end

  test "should have many class_rooms" do
    # This works if grade1_red in class_rooms.yml belongs to grade_one
    assert @level.class_rooms.count > 0
  end

  test "should have many subjects through courses" do
    # Verify the through association
    assert_respond_to @level, :subjects
  end

  test "destroying level should destroy associated class_rooms" do
    assert_difference "ClassRoom.count", -@level.class_rooms.count do
      @level.destroy
    end
  end
end