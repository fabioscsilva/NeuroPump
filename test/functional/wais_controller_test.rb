require 'test_helper'

class WaisControllerTest < ActionController::TestCase
  setup do
    @wai = wais(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:wais)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create wai" do
    assert_difference('Wai.count') do
      post :create, wai: { correct_items: @wai.correct_items, observations: @wai.observations, phase: @wai.phase, spent_time: @wai.spent_time, wrong_items: @wai.wrong_items }
    end

    assert_redirected_to wai_path(assigns(:wai))
  end

  test "should show wai" do
    get :show, id: @wai
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @wai
    assert_response :success
  end

  test "should update wai" do
    put :update, id: @wai, wai: { correct_items: @wai.correct_items, observations: @wai.observations, phase: @wai.phase, spent_time: @wai.spent_time, wrong_items: @wai.wrong_items }
    assert_redirected_to wai_path(assigns(:wai))
  end

  test "should destroy wai" do
    assert_difference('Wai.count', -1) do
      delete :destroy, id: @wai
    end

    assert_redirected_to wais_path
  end
end
