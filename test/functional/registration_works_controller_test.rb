require 'test_helper'

class RegistrationWorksControllerTest < ActionController::TestCase
  setup do
    @registration_work = registration_works(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:registration_works)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create registration_work" do
    assert_difference('RegistrationWork.count') do
      post :create, registration_work: { area: @registration_work.area, city: @registration_work.city, class: @registration_work.class, description: @registration_work.description, email: @registration_work.email, name: @registration_work.name, nominate: @registration_work.nominate, phone: @registration_work.phone, picture: @registration_work.picture, school: @registration_work.school, url_work: @registration_work.url_work }
    end

    assert_redirected_to registration_work_path(assigns(:registration_work))
  end

  test "should show registration_work" do
    get :show, id: @registration_work
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @registration_work
    assert_response :success
  end

  test "should update registration_work" do
    put :update, id: @registration_work, registration_work: { area: @registration_work.area, city: @registration_work.city, class: @registration_work.class, description: @registration_work.description, email: @registration_work.email, name: @registration_work.name, nominate: @registration_work.nominate, phone: @registration_work.phone, picture: @registration_work.picture, school: @registration_work.school, url_work: @registration_work.url_work }
    assert_redirected_to registration_work_path(assigns(:registration_work))
  end

  test "should destroy registration_work" do
    assert_difference('RegistrationWork.count', -1) do
      delete :destroy, id: @registration_work
    end

    assert_redirected_to registration_works_path
  end
end
