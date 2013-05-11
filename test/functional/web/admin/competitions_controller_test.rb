require 'test_helper'

class Web::Admin::CompetitionsControllerTest < ActionController::TestCase
  def setup
    @competition = create :competition
    @params = { id: @competition.id }
    @attrs = attributes_for(:competition)
  end

  test "should get index" do
    get :index, @params
    assert_response :success
  end

  test "should get new" do
    get :new, @params
    assert_response :success
  end

  test "should get show" do
    get :show, @params
    assert_response :success
  end

  test "should get edit" do
    get :edit, @params
    assert_response :success
  end

  test "should post create" do
    @params[:competition] = @attrs
    post :create, @params
    assert_response :redirect
  end

  test "should put update" do
    @params[:competition] = @attrs
    put :update, @params
    assert_response :redirect
  end

  test "should delete destroy" do
    delete :destroy, @params
    assert_response :redirect
  end
end
