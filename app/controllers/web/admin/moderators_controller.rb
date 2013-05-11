class Web::Admin::ModeratorsController < Web::Admin::ApplicationController
  respond_to :html
  
  def index
    params[:q] ||= {type_eq: "Moderator"}
    @q = User.ransack params[:q]
    @moderator = User.new type: "Moderator"
    @moderators = @q.result.page(params[:page])
    respond_with @moderators, location: admin_moderators_path
  end
  
  def send_invite_to_moderator
    @moderator = User.new params[:user]
    @moderator.type = "Moderator"
    @pwd = SecureRandom.hex(8)
    @moderator.password = @pwd
    @moderator.password_confirmation = @pwd
    @moderator.save
    UserMailer.experts(@moderator, @pwd).deliver
    respond_with @moderators, location: admin_moderators_path
  end
  
  def show
    @moderator = User.find params[:id]
    respond_with @moderator
  end
end
