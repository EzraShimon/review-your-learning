require 'test_helper'

class LearningsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @learning = learnings(:הלכה)
    @user = users(:ezraShimon)
  end

  test "index should only show root level learnings" do
    get user_learnings_url(@user)
    assert_match "פניני הלכה", @response.body
    assert_no_match "הלכות שבת", @response.body
    assert_no_match "הלכות תפילה", @response.body
  end

  test "should get new" do
    get new_user_learning_url(@user)
    assert_response :success
  end

  test "should create root learning" do
    assert_difference('Learning.count') do
      post user_learnings_url(@user), params: { learning: { description: @learning.description, user_id: @learning.user_id } }
    end

    assert_redirected_to learning_url(Learning.last)
  end
  
  test "should create nested learning" do
    assert_difference('Learning.count') do
      post user_learnings_url(@user), params: { learning: { description: "הלכות ברכות", user_id: @user }, parent_id: learnings(:הלכה) }
    end
    
    assert_redirected_to learning_url(Learning.last)
  end

  test "should show learning" do
    get learning_url(@learning)
    assert_response :success
  end

  test "should get edit" do
    get edit_learning_url(@learning)
    assert_response :success
  end

  test "should update learning" do
    patch learning_url(@learning), params: { learning: { description: @learning.description, user_id: @learning.user_id } }
    assert_redirected_to learning_url(@learning)
  end

  test "should destroy learning" do
    assert_difference('Learning.count', -1) do
      delete learning_url(@learning)
    end

    assert_redirected_to user_learnings_url(@user)
  end
end
