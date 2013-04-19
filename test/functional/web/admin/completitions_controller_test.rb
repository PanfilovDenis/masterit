require 'test_helper'

class Web::Admin::CompletitionsControllerTest < ActionController::TestCase
  def setup
    @completition = create :completition
    @params = { id: @completition.id }
    @attrs = attributes_for(:completition)
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
    @params[:completition] = @attrs
    post :create, @params
    assert_response :redirect
  end

  test "should put update" do
    @params[:completition] = @attrs
    put :update, @params
    assert_response :redirect
  end

  test "should delete destroy" do
    delete :destroy, @params
    assert_response :redirect
  end
end
