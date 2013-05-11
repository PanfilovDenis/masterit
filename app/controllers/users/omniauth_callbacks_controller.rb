class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    authorize
  end

  def vkontakte
    authorize
  end

  def google_oauth2
    authorize
  end

  def twitter 
    authorize
  end

  def registration
    email = params[:user][:email]
    
    if User.find_by_email email
      flash_notice
    else
      @user = User.new
      @user = get_user_by_populator(@user, auth_hash)
      @user.email = email
      @user.type = :User
      @user.authorizations << build_authorization(auth_hash)
      @user.type = "Participant"
      if @user.save
        sign_in @user
        flash_success
      else
        flash_error
      end

    end

    redirect_to root_path
  end

  def authorize
    save_omniauth_to_session

    authorization = Authorization.find_by_provider_and_uid(auth_hash[:provider], auth_hash[:uid].to_s)

    if !authorization && user_signed_in? 
      current_user.authorizations << build_authorization(auth_hash)      
      current_user.save
      flash_success
      redirect_to root_path
    elsif authorization
      sign_in authorization.user
      flash_success
      redirect_to root_path
    else
      @user = User.new
      render '/users/new'
    end  
  end

end
