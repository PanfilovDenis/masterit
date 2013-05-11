class Web::Moderator::WorksController < Web::Moderator::ApplicationController
  def index
    id = -1;
    id = current_user.region.id if current_user.region.present?
    @q = Work.ransack params[:q] || {region_id_eq: id}
    @works = @q.result.page(params[:page])
  end
  def show
    @work = Work.find_by_id params[:id]
    respond_with @work, location: moderator_work_path
  end
  def trigger_plagiat
    work = Work.find_by_id params[:id]
    if work.plagiat_state_banned?
      work.originality_confirm_plagiat_state
    else
      work.ban_plagiat_state
    end
    @q = Work.ransack params[:q] || {region_id_eq: current_user.region.id}
    @works = @q.result.page(params[:page])
    respond_with @works, location: moderator_works_path
  end
end
