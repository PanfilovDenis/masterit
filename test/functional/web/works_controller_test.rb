require 'test_helper'

class Web::WorksControllerTest < ActionController::TestCase

  setup do
    @user = create :user
    @work = create :work
    @attrs = attributes_for :work
    @request.env["devise.mapping"] = Devise.mappings[:user]
    sign_in @user
  end

  test "should get new" do
    get :new

    assert_response :success
  end

  test "should get create" do

    get :create, work: @attrs.merge(user_id: @user)
    work = Work.find @work
    assert work
    assert_response :redirect
  end

  test "should get index" do
    get :index

    assert_response :success
  end

  test "should get show" do
    get :show, id: @work

    assert_response :success
  end
end