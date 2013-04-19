class Web::Admin::RegionsController < Web::Admin::ApplicationController
  def index
    @q = Region.ransack params[:q]
    @regions = @q.result.page(params[:page])
  end

  def new
    @region = Region.new
  end

  def edit
    @region = Region.find(params[:id])
  end

  def create
    @region = Region.new params[:region]
    if @region.save
      flash_success
      redirect_to admin_regions_path
    else
      flash_error
      render action: :new
    end
  end

  def update
    @region = Region.find params[:id]

    if @region.update_attributes params[:region]
      flash_success
      redirect_to edit_admin_region_path(@region)
    else
      flash_error
      render action: :edit
    end
  end

  def destroy
    @region = Region.find params[:id]
    @region.destroy
    redirect_to admin_regions_path
  end
  
end
