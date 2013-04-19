require 'test_helper'

class Web::Admin::WorkNominationsControllerTest < ActionController::TestCase
  def setup
    @work_nomination = create :work_nomination
    @params = { id: @work_nomination.id }
    @attrs = attributes_for(:work_nomination)
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
    @params[:work_nomination] = @attrs
    post :create, @params
    assert_response :redirect
  end

  test "should put update" do
    @params[:work_nomination] = @attrs
    put :update, @params
    assert_response :redirect
  end

  test "should delete destroy" do
    delete :destroy, @params
    assert_response :redirect
  end
end
