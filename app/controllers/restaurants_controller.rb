class RestaurantsController < ApplicationController

  before_action :require_user, only: [:show]
  before_action :require_chef, only: [:chef]
  before_action :require_admin, only: [:index]
  #before_action :my_restaurant?, only: [:show, :chef]
  def index
    if params[:search]
      @restaurants = Restaurant.find(:all, :conditions => ['title LIKE ?', "%#{params[:search]}%"])
    else
      @restaurants = Restaurant.all
    end
  end

  def show
    @restaurant = Restaurant.find_by(slug: params[:id])
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(strong_params)

    if @restaurant.save
      flash[:success] = "You add a new restaurant into system"
      redirect_to restaurants_path
    else
      render 'new'
    end
  end

  def chef
    @restaurant = Restaurant.find_by(slug: params[:id])
    @tables = @restaurant.tables
    @tables.each do |table|
      table.orders
    end
  end

  private

  def strong_params
    params.require(:restaurant).permit(:name, :img_url)
  end
end