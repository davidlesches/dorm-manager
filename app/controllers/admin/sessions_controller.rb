class Admin::SessionsController < Admin::ApplicationController

  skip_before_filter :require_admin!

  def new
  end

  def create
    admin = Administrator.find_by_email(params[:session][:email])
    if admin && admin.authenticate(params[:session][:password])
      session[:admin_id] = admin.id
      redirect_to admin_root_url, notice: "Logged in!"
    else
      flash.now.alert = "Invalid login credentials."
      render :new
    end
  end

  def destroy
    session[:admin_id] = nil
    redirect_to admin_login_path
  end

end
