class Web::CommentsController < Web::ApplicationController
  def create
    @user = User.find params[:comment][:user_id]
    @work = Work.find params[:comment][:work_id]
    @user.create_comment for_object: @work, body: params[:comment][:body]

    redirect_to work_path(params[:comment][:work_id])
  end

  def destroy
    comment = ::Inkwell::Comment.find params[:id]
    comment.destroy
    redirect_to work_path params[:work_id]
  end
end