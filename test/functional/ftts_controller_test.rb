require 'test_helper'

class FttsControllerTest < ActionController::TestCase
  setup do
    @ftt = ftts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ftts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ftt" do
    assert_difference('Ftt.count') do
      post :create, ftt: { eighth: @ftt.eighth, fifth: @ftt.fifth, first: @ftt.first, fourth: @ftt.fourth, ninth: @ftt.ninth, observations: @ftt.observations, second: @ftt.second, seventh: @ftt.seventh, sixth: @ftt.sixth, tenth: @ftt.tenth, test_phase: @ftt.test_phase, third: @ftt.third }
    end

    assert_redirected_to ftt_path(assigns(:ftt))
  end

  test "should show ftt" do
    get :show, id: @ftt
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ftt
    assert_response :success
  end

  test "should update ftt" do
    put :update, id: @ftt, ftt: { eighth: @ftt.eighth, fifth: @ftt.fifth, first: @ftt.first, fourth: @ftt.fourth, ninth: @ftt.ninth, observations: @ftt.observations, second: @ftt.second, seventh: @ftt.seventh, sixth: @ftt.sixth, tenth: @ftt.tenth, test_phase: @ftt.test_phase, third: @ftt.third }
    assert_redirected_to ftt_path(assigns(:ftt))
  end

  test "should destroy ftt" do
    assert_difference('Ftt.count', -1) do
      delete :destroy, id: @ftt
    end

    assert_redirected_to ftts_path
  end
end
