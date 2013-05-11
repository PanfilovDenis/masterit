class Web::Competitions::PlagiatDetailsController < Web::Competitions::ApplicationController
  respond_to :html
  def new
    @competition = Competition.find(params[:competition_id])
    @work_nomination = WorkNomination.find(params[:work_nomination_id])
    @plagiat_detail = PlagiatDetail.new
    @plagiat_detail.work_id = params[:work_id]
  end
  def create
    @competition = Competition.find(params[:competition_id])
    @work_nomination = WorkNomination.find(params[:work_nomination_id])
    @plagiat_detail = PlagiatDetail.new params[:plagiat_detail]
    @plagiat_detail.user = current_user
    if @plagiat_detail.save
      flash_success
      redirect_to competition_work_nomination_path(@competition, @work_nomination)
    else
      flash_error
      render action: :new
    end
  end
  def update
    @competition = Competition.find(params[:competition_id])
    @work_nomination = WorkNomination.find(params[:work_nomination_id])
    @plagiat_detail = PlagiatDetail.find params[:plagiat_detail][:id]

    if @plagiat_detail.update_attributes params[:plagiat_detail]
      flash_success
      redirect_to competition_work_nomination_path(@competition, @work_nomination)
    else
      flash_error
      render action: :edit
    end
  end
  def edit
    @competition = Competition.find(params[:competition_id])
    @work_nomination = WorkNomination.find(params[:work_nomination_id])
    @plagiat_detail = PlagiatDetail.find(params[:plagiat_id])
  end
  def destroy
    @competition = Competition.find(params[:competition_id])
    @work_nomination = WorkNomination.find(params[:work_nomination_id])
    @plagiat_detail = PlagiatDetail.find params[:plagiat_id]
    @plagiat_detail.destroy
    redirect_to competition_work_nomination_path(@competition, @work_nomination) 
  end
end
