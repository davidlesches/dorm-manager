class SessionsController < ApplicationController

  skip_before_filter :require_user!

  def new
  end

  def create
    @counselor = Counselor.find_by_email params[:session][:email]
    if @counselor && @counselor.authenticate(params[:session][:password])
      session[:user_id] = @counselor.id
      flash[:notice] = "Welcome, #{@counselor.name}."
      redirect_to root_path
    else
      flash[:error] = "Invalid login credentials."
      redirect_to root_path
    end
  end

  def destroy
    reset_session
    redirect_to root_path
  end

end