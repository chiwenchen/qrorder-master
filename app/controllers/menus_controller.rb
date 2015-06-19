class MenusController < ApplicationController

  before_action :retrive_item, only: [:show, :edit, :update]
  before_action :require_manager, only: [:new, :create, :edit, :update]
  before_action :my_restaurant?, only: [:new, :create, :edit, :update]  

  def new
    @menu = Menu.new
    @restaurant = Restaurant.find_by(slug: params[:restaurant_id])
  end

  def create
    @menu = Menu.new(strong_params)
    @restaurant = Restaurant.find_by(slug: params[:restaurant_id])
    @menu.restaurant = @restaurant

    if @menu.save
      flash[:success] = "You Add a new dish: #{@menu.dish_name} "
      redirect_to restaurant_path(@restaurant)
    else
      render 'menus/new'
    end
  end

  def show; end

  def edit
    binding.pry
    @restaurant = Restaurant.find_by(slug: params[:restaurant_id])
  end

  def update
    @restaurant = Restaurant.find_by(slug: params[:restaurant_id])
    if @menu.update(strong_params)
      flash[:success] = "You Updated dish: #{@menu.dish_name} "
      redirect_to restaurant_path(@restaurant)
    else
      render 'edit'
    end
  end

  private

  def strong_params
    params.require(:menu).permit(:dish_name, :description, :photo, :restaurant_id)
  end

  def retrive_item
    #{"action"=>"edit", "controller"=>"menus", "restaurant_id"=>"1", "id"=>"1"}
    @menu = Menu.find(params[:id])
  end
end