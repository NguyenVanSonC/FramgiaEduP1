class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  private

  def logged_in_user
    return if logged_in?
    flash[:danger] = t "login"
    redirect_to login_url
  end
end
