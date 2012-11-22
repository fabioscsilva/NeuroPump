require 'test_helper'

class NeuropsychologistsControllerTest < ActionController::TestCase
  setup do
    @neuropsychologist = neuropsychologists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:neuropsychologists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create neuropsychologist" do
    assert_difference('Neuropsychologist.count') do
      post :create, neuropsychologist: { active: @neuropsychologist.active, address: @neuropsychologist.address, date_of_birth: @neuropsychologist.date_of_birth, email: @neuropsychologist.email, identification_code: @neuropsychologist.identification_code, mobilephone: @neuropsychologist.mobilephone, name: @neuropsychologist.name, password: @neuropsychologist.password, photo: @neuropsychologist.photo, telephone: @neuropsychologist.telephone }
    end

    assert_redirected_to neuropsychologist_path(assigns(:neuropsychologist))
  end

  test "should show neuropsychologist" do
    get :show, id: @neuropsychologist
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @neuropsychologist
    assert_response :success
  end

  test "should update neuropsychologist" do
    put :update, id: @neuropsychologist, neuropsychologist: { active: @neuropsychologist.active, address: @neuropsychologist.address, date_of_birth: @neuropsychologist.date_of_birth, email: @neuropsychologist.email, identification_code: @neuropsychologist.identification_code, mobilephone: @neuropsychologist.mobilephone, name: @neuropsychologist.name, password: @neuropsychologist.password, photo: @neuropsychologist.photo, telephone: @neuropsychologist.telephone }
    assert_redirected_to neuropsychologist_path(assigns(:neuropsychologist))
  end

  test "should destroy neuropsychologist" do
    assert_difference('Neuropsychologist.count', -1) do
      delete :destroy, id: @neuropsychologist
    end

    assert_redirected_to neuropsychologists_path
  end
end
