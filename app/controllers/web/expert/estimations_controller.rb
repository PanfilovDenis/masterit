class Web::Expert::EstimationsController < Web::Expert::ApplicationController
  def edit
    @estimation = Estimation.find params[:id]
    @work = @estimation.work
  end
  def update
    @estimation = Estimation.find params[:id]
    if @estimation.update_attributes params[:estimation]
      flash_success
      redirect_to expert_works_path
    else
      flash_error
      render action: :edit
    end
  end
end
