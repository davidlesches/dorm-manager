class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :require_user!


  private

  def current_user
    @current_user ||= Counselor.find_by_id(session[:user_id])
  end
  helper_method :current_user

  def require_user!
    redirect_to login_path unless current_user
  end

end
