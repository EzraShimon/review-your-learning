require 'test_helper'

class LearningsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @learning = learnings(:preparations_for_shabbos)
    @user = users(:ezra_shimon)
  end

  test "index should only show root level learnings" do
    get user_learnings_url(@user)
    assert_match "Preparations for Shabbos", @response.body
    assert_no_match "week connected to Shabbos like body and soul", @response.body
    assert_no_match "Hillel and Shamai", @response.body
  end

  test "should get new" do
    get new_user_learning_url(@user)
    assert_response :success
  end

  test "should create root learning" do
    assert_difference('Learning.count') do
      post user_learnings_url(@user), params: { learning: { user_id: @learning.user_id, description: @learning.description, learned_on: "2021-01-04" } }
    end

    assert_redirected_to learning_url(Learning.last)
  end
  
  test "should create nested learning" do
    assert_difference('Learning.count') do
      post user_learnings_url(@user), params: { learning: { description: "Man Without Faith", user_id: @user }, parent_id: learnings(:preparations_for_shabbos) }
    end
    
    assert_redirected_to learning_url(Learning.last)
  end

  test "should show learning" do
    get learning_url(@learning)
    assert_match(@learning.learned_on.to_s, @response.body)
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
