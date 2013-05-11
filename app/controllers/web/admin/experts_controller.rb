class Web::Admin::ExpertsController < Web::Admin::ApplicationController
  respond_to :html
  
  def index
    params[:q] ||= {type_eq: "Expert"}
    @q = User.ransack params[:q]
    @export = User.new type: "Export"
    @experts = @q.result.page(params[:page])
    respond_with @experts, location: admin_experts_path
  end
  
  def send_invite_to_expert
    @expert = User.new params[:user]
    @expert.type = "Expert"
    @pwd = SecureRandom.hex(8)
    @expert.password = @pwd
    @expert.password_confirmation = @pwd
    @expert.save
    UserMailer.experts(@expert, @pwd).deliver
    respond_with @experts, location: admin_experts_path
  end
  
  def show
    @expert = Expert.find params[:id]
    respond_with @expert
  end
end
