class Web::Admin::ToursController < Web::Admin::ApplicationController
  def index
    @q = Tour.ransack params[:q]
    @tours = @q.result.page(params[:page])
  end

  def new
    @tour = Tour.new
  end

  def edit
    @tour = Tour.find(params[:id])
  end

  def create
    @tour = Tour.new params[:tour]
    if @tour.save
      flash_success
      redirect_to admin_tours_path
    else
      flash_error
      render action: :new
    end
  end

  def update
    @tour = Tour.find params[:id]

    if @tour.update_attributes params[:tour]
      flash_success
      redirect_to edit_admin_tour_path(@tour)
    else
      flash_error
      render action: :edit
    end
  end

  def destroy
    @tour = Tour.find params[:id]
    @tour.destroy
    redirect_to admin_tours_path
  end
  
end
