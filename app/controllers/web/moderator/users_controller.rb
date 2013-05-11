class Web::Moderator::UsersController < Web::Moderator::ApplicationController
  respond_to :html
  def index
    @q = User.ransack params[:q]
    @users = @q.result.page(params[:page])
    respond_with @users, location: moderator_users_path
  end
  
  def invite_to_expert
    @user = User.find params[:participant][:id]
    @user.type = :expert.to_s.capitalize
    @user.save
    respond_with @users, location: moderator_users_path
  end

end
