class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      log_in user
      remember(user, params[:remember_me])
      redirect_to root_url, notice: "Logged in!"
    else
      flash.now.alert = "Email or password is invalid"
      render :new
    end
  end

  def destroy
    logout
    redirect_to root_url, notice: 'Logged Out'
  end
end
