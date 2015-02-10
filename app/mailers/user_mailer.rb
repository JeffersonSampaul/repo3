class UserMailer < ActionMailer::Base
  default from: "json6420@gmail.com"

  def welcome_user(user)
    @user = user
    @url = 'http://localhost:3005/login'
    mail(to: @user.email, subject: 'Welcome to blog application')
  end

  def password_change(user)
    @user = user
    @url = 'http://localhost:3005/password_change'
    mail(to: @user.email, subject: 'Password change request')
  end
end
