class SessionsController < ApplicationController

  before_action :send_my_back, only:[:new, :create]
  before_action :require_user, only:[:destroy]

  def new

  end

  def create
    user = User.find_by(name: params[:name])
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        flash[:success] = "Welcome back, #{user.name.titleize}"
        if current_user.role == 'Admin'
          redirect_to restaurants_path
        else
          redirect_to restaurant_path(user.restaurant)
        end
      else
        flash[:error] = 'Your username or password is wrong!!'
        render 'new'
      end
  end

  def destroy
    flash[:alert] = "See you next time, #{current_user.name.titleize}"
    session[:user_id] = nil
    redirect_to login_path

  end
end


