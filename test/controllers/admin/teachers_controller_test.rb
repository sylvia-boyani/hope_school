require "test_helper"

class Admin::TeachersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_teachers_index_url
    assert_response :success
  end

  test "should get new" do
    get admin_teachers_new_url
    assert_response :success
  end

  test "should get edit" do
    get admin_teachers_edit_url
    assert_response :success
  end
end
