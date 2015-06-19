class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?, :my_role, :my_restaurant, :require_manager, :require_chef, :require_waiter, :admin?, :stuff?;

  def current_user
    current_user ||= User.find(session[:user_id]) if session[:user_id]
    #return current_user obj
  end

  def logged_in?
    current_user
    #return true if logged in
  end 

  def my_role
    role ||= current_user.role if session[:user_id]
    #return user's role
  end

  def my_restaurant
    restaurant ||= current_user.restaurant.slug if session[:user_id]
    #return user's restaurant's slug
  end

  def admin?
    my_role == "Admin"
    #return true if user is admin
  end

  def stuff?
    my_role != "Admin"
    #return true if user is restaurant's stuff
  end

  def require_user
    access_denied if !logged_in?
  end

  def require_admin
    access_denied if my_role != "Admin"    
  end

  def require_manager
    if (my_role != "Admin" && my_role != "Manager")
      flash[:warning] = "Only Manager can do this"
      redirect_to restaurant_path(current_user.restaurant)
    end
  end

  def require_chef
    access_denied if (my_role != "Admin" && my_role != "Manager" && my_role != "Chef")
  end

  def require_waiter
    access_denied if (my_role != "Admin" && my_role != "Manager" && my_role != "Chef" && my_role != "Waiter")
  end

  def access_denied
    if !logged_in?
      flash[:error] = "You will need proper authorization to do this"
      redirect_to login_path
    elsif admin?
      redirect_to restaurants_path
    elsif stuff?
      to_my_restaurant 
    end 
  end

  def my_restaurant?
    return true if current_user.role == "Admin" #Admin can access all restaurants, do all things
    to_my_restaurant if my_restaurant != params[:restaurant_id] #compare slug
  end

  def to_my_restaurant
    flash[:success] = "Here is your place"
    redirect_to restaurant_path(current_user.restaurant)
  end

  def send_my_back
    if my_role == "Admin"
      redirect_to restaurants_path
    elsif logged_in?
      to_my_restaurant
    end
  end

end
