class Web::Admin::WorksController < Web::Admin::ApplicationController
  def index
    @q = WorkCreateType.ransack params[:q]
    @works = @q.result.page(params[:page])
  end
  
  def new
    @work = Work.new
  end
  
  def edit
    @work = WorkCreateType.find(params[:id])
  end
  
  def update
    @work = WorkCreateType.find params[:id]

    if @work.update_attributes params[:work]
      flash_success
      redirect_to edit_admin_work_nomination_path(@work)
    else
      flash_error
      render action: :edit
    end
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
  
  def destroy
    @work = Work.find params[:id]
    @work.destroy
    redirect_to admin_works_path
  end
end