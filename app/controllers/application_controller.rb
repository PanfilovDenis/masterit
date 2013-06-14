class ApplicationController < ActionController::Base
  include SocNetworkHelper
  include FlashHelper

  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => "forbidden"
  end
end
