class Web::Moderator::Experts::ApplicationController < Web::Moderator::ApplicationController
  respond_to :html
  helper_method :title_head
  before_filter :title_head
end
