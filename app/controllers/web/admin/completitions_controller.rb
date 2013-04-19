class Web::Admin::CompletitionsController < Web::Admin::ApplicationController
  def index
    @q = Completition.ransack params[:q]
    @completitions = @q.result.page(params[:page])
  end

  def new
    @completition = Completition.new
  end

  def edit
    @completition = Completition.find(params[:id])
  end

  def create
    @completition = Completition.new params[:completition]
    if @completition.save
      flash_success
      redirect_to admin_completitions_path
    else
      flash_error
      render action: :new
    end
  end

  def update
    @completition = Completition.find params[:id]

    if @completition.update_attributes params[:completition]
      flash_success
      redirect_to edit_admin_completition_path(@completition)
    else
      flash_error
      render action: :edit
    end
  end

  def destroy
    @completition = Completition.find params[:id]
    @completition.destroy
    redirect_to admin_completitions_path
  end
  
end
