class Web::Expert::WorksController < Web::Expert::ApplicationController
  def index
    @works = current_user.basket.works
    respond_with @works, location: expert_works_path
  end
  def show
    @work = Work.find_by_id params[:id]
    respond_with @work, location: expert_work_path
  end
  def trigger_estimate
    work = Work.find_by_id params[:id]
    if work.estimate_state_estimated?
      work.prepare_estimate_state
    else
      work.estimate_estimate_state
    end
    @works = current_user.basket.works
    respond_with @works, location: expert_works_path
  end
  def remove_from_basket
    @work = Work.find_by_id params[:id]
    current_user.basket.works.delete @work
    @works = current_user.basket.works
    respond_with @works, location: expert_works_path
  end
end
