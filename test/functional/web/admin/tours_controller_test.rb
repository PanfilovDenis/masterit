require 'test_helper'

class Web::Admin::ToursControllerTest < ActionController::TestCase
  def setup
    @tour = create :tour
    @params = { id: @tour.id }
    @attrs = attributes_for(:tour)
  end

  test "should get index" do
    get :index, @params
    assert_response :success
  end

  test "should get new" do
    get :new, @params
    assert_response :success
  end

  test "should get edit" do
    get :edit, @params
    assert_response :success
  end

  test "should post create" do
    @params[:tour] = @attrs
    post :create, @params
    assert_response :redirect
  end

  test "should put update" do
    @params[:tour] = @attrs
    put :update, @params
    assert_response :redirect
  end

  test "should delete destroy" do
    delete :destroy, @params
    assert_response :redirect
  end
end
