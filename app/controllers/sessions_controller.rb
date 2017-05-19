class SessionsController < ApplicationController
  def new
  end

  # def show
  # end

  def create
    @user = User.find_by(username: params[:username]).try(:authenticate, params[:password])
    if @user.nil?
      return redirect_to root_path, notice: "Please create an account."
    else
      session[:user_id] = @user.id
      return redirect_to expense_categories_path if @user
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You are now logged out"
    redirect_to root_url
  end
end
