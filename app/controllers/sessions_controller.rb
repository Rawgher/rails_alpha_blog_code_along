class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      # allows user to authenticate here and then stay logged in until they use the destroy function (this is a cookie)
      # other things can be saved in the session portion to be used in the application
      session[:user_id] = user.id
      flash[:notice] = "Logged in successfully"
      redirect_to user
    else
      flash.now[:alert] = "There was something wrong with your login credentials"
      render 'new'
    end
  end

  def destroy
    # clearing out the cookie stored from the create function to log the user out
    session[:user_id] = nil
    flash[:notice] = "Logged out"
    redirect_to root_path
  end

end
