require 'test_helper'

class HandednessesControllerTest < ActionController::TestCase
  setup do
    @handedness = handednesses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:handednesses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create handedness" do
    assert_difference('Handedness.count') do
      post :create, handedness: { description: @handedness.description }
    end

    assert_redirected_to handedness_path(assigns(:handedness))
  end

  test "should show handedness" do
    get :show, id: @handedness
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @handedness
    assert_response :success
  end

  test "should update handedness" do
    put :update, id: @handedness, handedness: { description: @handedness.description }
    assert_redirected_to handedness_path(assigns(:handedness))
  end

  test "should destroy handedness" do
    assert_difference('Handedness.count', -1) do
      delete :destroy, id: @handedness
    end

    assert_redirected_to handednesses_path
  end
end
