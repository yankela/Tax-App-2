class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?
  # before_action :autheticated


  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    # not @current_user.nil? # was !!current_user
    !!current_user
  end

  def require_logged_in
    if !logged_in? #was !logged_in?
      redirect_to new_sessions_path, :notice => "Log in please!"
    end
  end

  # def autheticated
  #   if logged_in?
  #     redirect_to expense_categories_path
  #   else
  #     redirect_to root_path
  #   end
  # end
end
