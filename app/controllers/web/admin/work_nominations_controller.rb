class Web::Admin::WorkNominationsController < Web::Admin::ApplicationController
  def index
    @q = WorkNomination.ransack params[:q]
    @work_nominations = @q.result.page(params[:page])
  end

  def new
    @work_nomination = WorkNomination.new
  end

  def edit
    @work_nomination = WorkNomination.find(params[:id])
  end

  def create
    @work_nomination = WorkNomination.new params[:work_nomination]
    if @work_nomination.save
      flash_success
      redirect_to admin_work_nominations_path
    else
      flash_error
      render action: :new
    end
  end

  def update
    @work_nomination = WorkNomination.find params[:id]

    if @work_nomination.update_attributes params[:work_nomination]
      flash_success
      redirect_to edit_admin_work_nomination_path(@work_nomination)
    else
      flash_error
      render action: :edit
    end
  end

  def destroy
    @work_nomination = WorkNomination.find params[:id]
    @work_nomination.destroy
    redirect_to admin_work_nominations_path
  end
  
  def trigger_state_event
      @work_nomination = User.find(params[:id])
      @work_nomination.fire_state_event(params[:event])

      flash_success
      redirect_to action: :index
  end
end
