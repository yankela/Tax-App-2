class SessionsController < ApplicationController
  def new
  end

  # def show
  # end

  def create
    @user = User.find_by(username: params[:username]).try(:authenticate, params[:password])
    if @user.nil?
      return redirect_to new_users_path
    else
      session[:user_id] = @user.id
      return redirect_to expense_categories_path if @user
    end
  end
end
