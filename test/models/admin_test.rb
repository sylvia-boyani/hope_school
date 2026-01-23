require "test_helper"

class AdminTest < ActiveSupport::TestCase
  setup do
    @admin = admins(:super_admin)
  end

  test "should be valid" do
    assert @admin.valid?
  end

  test "should be invalid without email" do
    @admin.email = ""
    assert_not @admin.valid?
  end

  test "should be invalid with a malformed email" do
    @admin.email = "not_an_email"
    assert_not @admin.valid?
  end

  test "email should be unique" do
    duplicate_admin = @admin.dup
    assert_not duplicate_admin.valid?
  end

  test "password should be required" do
    # Creating a new admin without a password
    new_admin = Admin.new(email: "new@hopeschool.com")
    assert_not new_admin.valid?
  end
end