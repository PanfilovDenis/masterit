require 'test_helper'

class Web::Admin::RegionsControllerTest < ActionController::TestCase
  def setup
    @region = create :region
    @params = { id: @region.id }
    @attrs = attributes_for(:region)
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
    @params[:region] = @attrs
    post :create, @params
    assert_response :redirect
  end

  test "should put update" do
    @params[:region] = @attrs
    put :update, @params
    assert_response :redirect
  end

  test "should delete destroy" do
    delete :destroy, @params
    assert_response :redirect
  end
end
