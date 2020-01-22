class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  def current_user
    if (auth_token = session[:auth_token])
      @current_user ||= User.find_by(auth_token: auth_token)
    elsif (auth_token = cookies.encrypted[:auth_token])
      user = User.find_by(auth_token: auth_token)
      if user
        log_in user
        @current_user = user
      end
    end
  end

  def log_in(user)
    session[:auth_token] = user.auth_token
  end

  def remember(user, remember_me)
    if remember_me
      cookies.encrypted[:auth_token] = { value: user.auth_token, expires: 2.weeks.from_now }
    else
      cookies.encrypted[:auth_token] = user.auth_token
    end
  end

  def logout
    session.delete(:auth_token)
    cookies.delete(:auth_token)
  end

  helper_method :current_user
end
