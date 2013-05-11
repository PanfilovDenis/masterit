class Web::Competitions::WorkNominationsController < Web::Competitions::ApplicationController
  def index
    @work_nominations = resource_competition.work_nominations
  end
  
  def show
    @work_nomination = resource_competition.work_nominations.find params[:id]
    @work_nominations = resource_competition.work_nominations
  end

end
