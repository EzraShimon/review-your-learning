require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get new_user_url
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post users_url, params: { user: valid_user_hash_for_create }
    end
    assert_equal 'Thank you for signing up!', flash[:notice]
  end
  
  test "should not create invalid user" do
    assert_no_difference('User.count') do
      post users_url, params: { user: invalid_user_hash_for_create }
    end
  end
end
