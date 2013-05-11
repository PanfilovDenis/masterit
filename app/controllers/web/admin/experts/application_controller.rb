class Web::Admin::Experts::ApplicationController < Web::Admin::ApplicationController
  respond_to :html
  helper_method :title_head
  before_filter :title_head
end
