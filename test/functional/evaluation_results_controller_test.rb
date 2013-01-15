require 'test_helper'

class EvaluationResultsControllerTest < ActionController::TestCase
  setup do
    @evaluation_result = evaluation_results(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:evaluation_results)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create evaluation_result" do
    assert_difference('EvaluationResult.count') do
      post :create, evaluation_result: { conclusion: @evaluation_result.conclusion, context: @evaluation_result.context, solution: @evaluation_result.solution }
    end

    assert_redirected_to evaluation_result_path(assigns(:evaluation_result))
  end

  test "should show evaluation_result" do
    get :show, id: @evaluation_result
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @evaluation_result
    assert_response :success
  end

  test "should update evaluation_result" do
    put :update, id: @evaluation_result, evaluation_result: { conclusion: @evaluation_result.conclusion, context: @evaluation_result.context, solution: @evaluation_result.solution }
    assert_redirected_to evaluation_result_path(assigns(:evaluation_result))
  end

  test "should destroy evaluation_result" do
    assert_difference('EvaluationResult.count', -1) do
      delete :destroy, id: @evaluation_result
    end

    assert_redirected_to evaluation_results_path
  end
end
