require 'test_helper'

class UsersDecisionsControllerTest < ActionController::TestCase
  setup do
    @users_decision = users_decisions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users_decisions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create users_decision" do
    assert_difference('UsersDecision.count') do
      post :create, :users_decision => @users_decision.attributes
    end

    assert_redirected_to users_decision_path(assigns(:users_decision))
  end

  test "should show users_decision" do
    get :show, :id => @users_decision.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @users_decision.to_param
    assert_response :success
  end

  test "should update users_decision" do
    put :update, :id => @users_decision.to_param, :users_decision => @users_decision.attributes
    assert_redirected_to users_decision_path(assigns(:users_decision))
  end

  test "should destroy users_decision" do
    assert_difference('UsersDecision.count', -1) do
      delete :destroy, :id => @users_decision.to_param
    end

    assert_redirected_to users_decisions_path
  end
end
