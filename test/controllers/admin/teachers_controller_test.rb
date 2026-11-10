require "test_helper"

class Admin::TeachersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_teachers_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_teacher_url
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_teacher_url
    assert_response :success
  end
end
