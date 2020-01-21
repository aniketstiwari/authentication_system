class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  def current_user
    @current_user ||= User.find_by(auth_token: cookies.signed[:auth_token]) if cookies.signed[:auth_token]
  end

  helper_method :current_user
end
