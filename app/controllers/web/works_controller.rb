class Web::WorksController < Web::ApplicationController
  def new
    @work = Work.new
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

  def index
    @works = Work.scoped
  end

  def show
    @work = Work.find params[:id]
    @comments = @work.commentline
    @new_comment = Inkwell::Comment.new
    @like_count = eval(@work.users_ids_who_favorite_it)
  end

  def download_pdf
    report = UserReport.new
    user = User.find(params[:id])
    result = report.generate_pdf "Report"
    send_data result, type: 'application/pdf', filename: report.pdf_filename(user)
    pdf = Magick::ImageList.new(result)
    pdf.write("report.jpg")
  end

  def favorite
    work = Work.find(params[:work_id])
    current_user.favorite work
    redirect_to work_path(work)
  end

  def unfavorite
    work = Work.find(params[:work_id])
    current_user.unfavorite work
    redirect_to work_path(work)
  end
end
