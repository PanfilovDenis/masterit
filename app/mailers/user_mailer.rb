class UserMailer < ActionMailer::Base
  default_url_options[:host] = configus.mailer.default_host
  default from: configus.mailer.default_from

  def welcome(user)
    @user = user
    mail to: @user.email
  end
  
  def experts(expert, pwd)
    @expert = expert
    @pwd = pwd
    mail to: @expert.email, subject: "Welcome Expert on Master-IT"
  end
  
  def moderators(moderator, pwd)
    @moderator = moderator
    @pwd = pwd
    mail to: @moderator.email, subject: "Welcome Moderator on Master-IT"
  end
end
