require 'test_helper'

class WmsControllerTest < ActionController::TestCase
  setup do
    @wm = wms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:wms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create wm" do
    assert_difference('Wm.count') do
      post :create, wm: { correct_items: @wm.correct_items, observations: @wm.observations, phase: @wm.phase, wrong_items: @wm.wrong_items }
    end

    assert_redirected_to wm_path(assigns(:wm))
  end

  test "should show wm" do
    get :show, id: @wm
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @wm
    assert_response :success
  end

  test "should update wm" do
    put :update, id: @wm, wm: { correct_items: @wm.correct_items, observations: @wm.observations, phase: @wm.phase, wrong_items: @wm.wrong_items }
    assert_redirected_to wm_path(assigns(:wm))
  end

  test "should destroy wm" do
    assert_difference('Wm.count', -1) do
      delete :destroy, id: @wm
    end

    assert_redirected_to wms_path
  end
end
