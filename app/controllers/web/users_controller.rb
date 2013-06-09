class Web::UsersController < Web::ApplicationController
  require 'RMagick'
  def show
    @user = User.find params[:id]
  end

  def edit
    @user = User.find params[:id]
  end

  def download_pdf
    report = UserReport.new
    user = User.find(params[:id])
    result = report.generate_pdf "Report"
    send_data result, type: 'application/pdf', filename: report.pdf_filename(user) 
    pdf = Magick::ImageList.new(result)
    pdf.write("report.jpg")
  end

  def update
    @user = User.find params[:id]

    if @user.update_attributes params[:user]
      redirect_to edit_user_path(@user)
    else
      render action: :edit
    end
  end
end
