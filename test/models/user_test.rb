require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "should validate case insensitive uniqueness of email address" do
    assert User.new(
        email: "EzraShimon@reviewyourlearning.com",
        password: "password",
        password_confirmation: "password"
      ).invalid?, "Expected duplicate email with TitleCase to be invalid"
  end
end
