module ApplicationHelper
  # can add helper methods here to have them available for my views

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

end
