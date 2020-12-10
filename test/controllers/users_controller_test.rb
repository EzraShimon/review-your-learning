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
  
  test "should login user regardless of email address case" do
    post sessions_url, params: {
        email: "EzraShimon@reviewyourlearning.com",
        password: "testpassword",
        password_confirmation: "testpassword" } 
    assert_equal users(:ezraShimon).id, session[:user_id],
      "Expected users(:ezraShimon).id to equal session[:user_id]"
  end
end
