class Web::Competitions::ApplicationController < Web::ApplicationController
  helper_method :resource_competition

protected
  def resource_competition
    @competition ||= Competition.find params[:competition_id]
  end
  
end
