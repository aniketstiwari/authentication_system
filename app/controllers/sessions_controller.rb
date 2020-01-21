class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      if params[:remember_me]
        cookies.signed[:auth_token] = { value: user.auth_token, expires: 2.weeks.from_now }
      else
        cookies.signed[:auth_token] = user.auth_token
      end
      redirect_to root_url, notice: "Logged in!"
    else
      flash.now.alert = "Email or password is invalid"
      render :new
    end
  end

  def destroy
    cookies.delete(:auth_token)
    redirect_to root_url, notice: 'Logged Out'
  end
end
