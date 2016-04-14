class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:notice] = "Log In Successful"
      redirect_to items_path
    else
      flash[:error] = "Invalid Login"
      render :new
    end
  end

  def destroy
    session.clear
    flash[:notice] = "Successfully Logged Out"
    redirect_to root_path
  end
end
