class SessionsController < ApplicationController

  def new
    # @session = Session.new
  end

  def create
    user = User.find_by(email: params[:email]).try(:authenticate, params[:password])
    if user
     flash[:success] = "Successfully logged in"
     redirect_to new_personal_info_path
    else
     flash[:warning] = "User not found. Please register first"
     render "new" 
    end
  end

  def password_reset_email
    @message = "Enter an email where password reset link has to be sent"
  end 

  def change_password
    user = User.find_by(email: params[:email])
    if user
      UserMailer.password_change(user).deliver
      redirect_to registration_path
    else
      flash[:warning] = "You are not a registered user. Please Sign up"
      render "new" 
    end 
  end 

end
