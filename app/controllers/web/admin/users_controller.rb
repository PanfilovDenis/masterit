class Web::Admin::UsersController < Web::Admin::ApplicationController
  respond_to :html
  def index
    @q = User.ransack params[:q]
    @users = @q.result.page(params[:page])
    respond_with @users, location: admin_users_path
  end
  
  def invite_to_expert
    @user = User.find params[:participant][:id]
    @user.type = :expert.to_s.capitalize
    @user.save
    respond_with @users, location: admin_users_path
  end

  def invite_to_moderator
    @user = User.find params[:participant][:id]
    @user.type = :moderator.to_s.capitalize
    @user.save
    respond_with @users, location: admin_users_path
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find params[:id]

    if @user.update_attributes params[:user]
      flash_success
      redirect_to edit_admin_user_path(@user)
    else
      flash_error
      render action: :edit
    end
  end
end
