class Admin::ApplicationController < ApplicationController

  layout 'admin'

  skip_before_filter :require_user!
  before_filter :require_admin!


  private

  def current_admin
    @current_admin ||= Administrator.find_by_id(session[:admin_id])
  end
  helper_method :current_admin

  def require_admin!
    redirect_to admin_login_url, alert: 'Please login to proceed.' if current_admin.nil?
  end

end