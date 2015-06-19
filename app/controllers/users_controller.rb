class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(strong_params)

    if @user.save
      session[:user_id] = @user.id
      flash[:success] = 'You register a new role'
      send_my_back
    else
      render 'new'
    end

  end

  private

  def strong_params
    params.require(:user).permit(:name, :password, :role, :restaurant_id)
  end


end