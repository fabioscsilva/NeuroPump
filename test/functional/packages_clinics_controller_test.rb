require 'test_helper'

class PackagesClinicsControllerTest < ActionController::TestCase
  setup do
    @packages_clinic = packages_clinics(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:packages_clinics)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create packages_clinic" do
    assert_difference('PackagesClinic.count') do
      post :create, packages_clinic: {  }
    end

    assert_redirected_to packages_clinic_path(assigns(:packages_clinic))
  end

  test "should show packages_clinic" do
    get :show, id: @packages_clinic
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @packages_clinic
    assert_response :success
  end

  test "should update packages_clinic" do
    put :update, id: @packages_clinic, packages_clinic: {  }
    assert_redirected_to packages_clinic_path(assigns(:packages_clinic))
  end

  test "should destroy packages_clinic" do
    assert_difference('PackagesClinic.count', -1) do
      delete :destroy, id: @packages_clinic
    end

    assert_redirected_to packages_clinics_path
  end
end
