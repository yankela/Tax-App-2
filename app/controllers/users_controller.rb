class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new user_params

    respond_to do |format|
      if @user.save
        format.html { redirect_to expense_categories_path, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
        session[:user_id] = @user.id
      else
        format.html { redirect_to root_path, notice: "Please fill in all required fields." }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def logged_in_player
    
    render json: {player: current_user.id}

  end


  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation, :first_name, :last_name)
  end


end
