require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  setup do
    @user = users(:ezra_shimon)
  end

  test "creating a User" do
    visit new_user_url
    fill_in "Email", with: "new@reviewyourlearning.com"
    fill_in "Password", with: "testpassword"
    fill_in "Password confirmation", with: "testpassword"
    click_button "Sign Up"
    assert_text "Thank you for signing up!"
  end
end
