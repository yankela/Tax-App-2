class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?


  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !!current_user
  end

  def require_logged_in
    if !logged_in?
      redirect_to new_sessions_path, :notice => "Log in please!"
    end
  end
end
