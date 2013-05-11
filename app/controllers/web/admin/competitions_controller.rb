# encoding=utf-8
class Web::Admin::CompetitionsController < Web::Admin::ApplicationController
  def index
    @q = Competition.ransack params[:q]
    @competitions = @q.result.page(params[:page])
  end

  def new
    @competition = Competition.new
    @commpetition.assign_attributes params[:competition]
    tours = @competition.tours.map(&:name)
    tours_names = ["Школьный", "Муниципальный", "Региональный"]
    if tours.size < tours_names.size
      tours_names.each{|tour_name| @competition.tours.build(name: tour_name) if tours.exclude?(tour_name)}
    end
  end

  def show
    @competition = Competition.find(params[:id])
    title_head(competition_name: @competition.name)
  end

  def edit
    @competition = Competition.find(params[:id])
  end

  def create
    @competition = Competition.new params[:competition]
    if @competition.save
      flash_success
      redirect_to admin_competitions_path
    else
    tours = @competition.tours.map(&:name)
    tours_names = ["Школьный", "Муниципальный", "Региональный"]
    if tours.size < tours_names.size
      tours_names.each{|tour_name| @competition.tours.build(name: tour_name) if tours.exclude?(tour_name)}
    end
      flash_error
      render action: :new
    end
  end

  def update
    @competition = Competition.find params[:id]

    if @competition.update_attributes params[:competition]
      flash_success
      redirect_to edit_admin_competition_path(@competition)
    else
    tours = @competition.tours.map(&:name)
    tours_names = ["Школьный", "Муниципальный", "Региональный"]
    if tours.size < tours_names.size
      tours_names.each{|tour_name| @competition.tours.build(name: tour_name) if tours.exclude?(tour_name)}
    end
      flash_error
      render action: :edit
    end
  end

  def destroy
    @competition = Competition.find params[:id]
    @competition.destroy
    redirect_to admin_competitions_path
  end
  
end
