require "test_helper"

class Admin::StudentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_students_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_student_url
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_student_url
    assert_response :success
  end
end
