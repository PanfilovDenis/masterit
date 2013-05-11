class Web::WorksController < Web::ApplicationController
  def new
    @work = Work.new
  end
  
  def show
    @work = Work.find params[:id]
  end
  
  def create
    @work = WorkCreateType.new params[:work]
    if @work.save
      flash[:success] = flash_translate(:success)
      redirect_to user_path(current_user)
    else
      render :action => :new
    end
  end
end