require "application_system_test_case"

class LearningsTest < ApplicationSystemTestCase
  setup do
    @learning = learnings(:הלכה)
    @user = @learning.user
    visit root_url
    fill_in "Email", with: @user.email
    fill_in "Password", with: "testpassword"
    click_button "Log In"
  end

  test "visiting the index" do
    visit user_learnings_url(@user)
    assert_selector "h1", text: "Learnings"
  end

  test "creating a root level Learning" do
    visit user_learnings_url(@user)
    click_on "New Learning"

    fill_in "Description", with: @learning.description
    click_on "Create Learning"

    assert_text "Learning was successfully created"
    click_on "Back"
  end
  
  test "creating a nested Learning" do
    visit user_learnings_url(@user)
    click_on "פניני הלכה"
    click_on "New Detail"
    fill_in "Description", with: "הלכות ברכות"
    click_on "Create Learning"
    assert_text "Learning was successfully created"
    click_on "Back"
  end

  test "updating a Learning" do
    visit user_learnings_url(@user)
    click_on "Edit", match: :first

    fill_in "Description", with: @learning.description
    click_on "Update Learning"

    assert_text "Learning was successfully updated"
    click_on "Back"
  end

  test "destroying a Learning" do
    visit user_learnings_url(@user)
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Learning was successfully destroyed"
  end
end
