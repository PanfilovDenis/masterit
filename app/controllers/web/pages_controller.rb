class Web::PagesController < Web::ApplicationController
  def show
    @page = Page.web.find params[:id]
  end
end
