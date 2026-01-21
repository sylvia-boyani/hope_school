require "test_helper"

class StudentTest < ActiveSupport::TestCase
  def setup
    @student = students(:jane)
  end

  test "fixture is valid" do
    assert @student.valid?
  end

  test "is invalid without first_name" do
    @student.first_name = nil
    assert_not @student.valid?
    assert_includes @student.errors[:first_name], "can't be blank"
  end

  test "is invalid without last_name" do
    @student.last_name = nil
    assert_not @student.valid?
    assert_includes @student.errors[:last_name], "can't be blank"
  end

  test "is invalid without admission_number" do
    @student.admission_number = nil
    assert_not @student.valid?
    assert_includes @student.errors[:admission_number], "can't be blank"
  end

  test "belongs to a class_room" do
    assert_not_nil @student.class_room
  end

  test "name returns full name" do
    assert_equal "Jane Doe", @student.name
  end

  test "photo_thumbnail returns avatar url when no photo attached" do
    url = @student.photo_thumbnail
    assert_match(/ui-avatars.com/, url)
    assert_match(/Jane\+Doe/, url)
  end
end