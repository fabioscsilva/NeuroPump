require 'test_helper'

class TmtsControllerTest < ActionController::TestCase
  setup do
    @tmt = tmts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tmts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tmt" do
    assert_difference('Tmt.count') do
      post :create, tmt: { observations: @tmt.observations, phase: @tmt.phase, time: @tmt.time }
    end

    assert_redirected_to tmt_path(assigns(:tmt))
  end

  test "should show tmt" do
    get :show, id: @tmt
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tmt
    assert_response :success
  end

  test "should update tmt" do
    put :update, id: @tmt, tmt: { observations: @tmt.observations, phase: @tmt.phase, time: @tmt.time }
    assert_redirected_to tmt_path(assigns(:tmt))
  end

  test "should destroy tmt" do
    assert_difference('Tmt.count', -1) do
      delete :destroy, id: @tmt
    end

    assert_redirected_to tmts_path
  end
end
