class Web::Expert::WorkNominationsController < Web::Expert::ApplicationController
  def index
    @q = WorkNomination.ransack params[:q]
    @work_nominations = @q.result.page(params[:page])
  end

end
