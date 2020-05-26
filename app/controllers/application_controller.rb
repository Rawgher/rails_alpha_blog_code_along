class ApplicationController < ActionController::Base
  # any methods added here will allow them to be accessible to the controllers

  # this makes this method available to the views as well as the controllers
  helper_method :current_user, :logged_in?

  # below method was moved from the application_helper.rb file
  # function to show information about the current user in the application
  def current_user
    # can write if statements like this in some cases where there isn't an else
    # if we've already done this check, use @current_user, otherwise do the query to find them
    # memoization
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  # checking if a user is logged in by using the @current_user from above
  def logged_in?
    # !! turns current_user in to a boolean
    !!current_user
  end

  # method checking if a user is logged in to keep them from accessing certain paths
  def require_user
    if !logged_in?
      flash[:alert] = "You must be logged in to perform that action"
      redirect_to login_path
    end
  end
end
