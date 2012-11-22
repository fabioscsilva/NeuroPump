require 'test_helper'

class AdministratorsControllerTest < ActionController::TestCase
  setup do
    @administrator = administrators(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:administrators)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create administrator" do
    assert_difference('Administrator.count') do
      post :create, administrator: { active: @administrator.active, address: @administrator.address, email: @administrator.email, mobilephone: @administrator.mobilephone, name: @administrator.name, password: @administrator.password, telephone: @administrator.telephone }
    end

    assert_redirected_to administrator_path(assigns(:administrator))
  end

  test "should show administrator" do
    get :show, id: @administrator
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @administrator
    assert_response :success
  end

  test "should update administrator" do
    put :update, id: @administrator, administrator: { active: @administrator.active, address: @administrator.address, email: @administrator.email, mobilephone: @administrator.mobilephone, name: @administrator.name, password: @administrator.password, telephone: @administrator.telephone }
    assert_redirected_to administrator_path(assigns(:administrator))
  end

  test "should destroy administrator" do
    assert_difference('Administrator.count', -1) do
      delete :destroy, id: @administrator
    end

    assert_redirected_to administrators_path
  end
end
