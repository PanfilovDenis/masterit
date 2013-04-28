require 'test_helper'

class Web::CommentsControllerTest < ActionController::TestCase

  setup do
    @user = create :user
    @work = create :work
    @request.env["devise.mapping"] = Devise.mappings[:user]
    sign_in @user
    @params = {}
    @params[:body] = "ads"
  end

  test "should get create" do
    get :create, comment: @params.merge(user_id: @user, work_id: @work)

    assert :redirect
  end
end