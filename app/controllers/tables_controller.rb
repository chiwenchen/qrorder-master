class TablesController < ApplicationController

  before_action :require_manager, only:[:create, :destroy]

  def show
    @table = Table.find(params[:id])
    @restaurant = @table.restaurant
    session[:order] = {}
    @order = nil
    session[:table] = @table.id
  end

  def create
    restaurant = Restaurant.find_by(slug: params[:restaurant_id])
    length = Table.where(restaurant_id: restaurant.id).length  
    @table = Table.create(restaurant_id: restaurant.id, number: length + 1 )
    redirect_to restaurant_path(params[:restaurant_id])
  end

  def destroy
    restaurant = Restaurant.find_by(slug: params[:id])
    Table.delete(Table.where(restaurant_id: restaurant.id).last.id)
    redirect_to restaurant_path(params[:id])
  end


  def order
    @table = Table.find(params[:id])
    @restaurant = @table.restaurant
    #dish = Menu.find(params[:menu])
    @order = session[:order][params[:menu]]

    if params[:selection] == 'order'
      if @order.nil?
        session[:order][params[:menu]] = 1
      else
        session[:order][params[:menu]] += 1
      end
    else
      session[:order][params[:menu]] -= 1 if !@order.nil?
    end

    session[:order].delete(params[:menu]) if session[:order][params[:menu]] == 0 
    #render 'show'
    respond_to do |format|
      format.html {render 'show'}
      format.js {render 'order.js.erb'}
    end
  end

  def place_order
    table = Table.find(params[:id])
    restaurant = table.restaurant
    session[:order].each do |menu, qty|
      Order.create(table_id: session[:table], menu_id: menu, quantity: qty, status: "Preparing")
    end
    session[:order] = {}
    flash[:success] = "You placed a order"
    redirect_to restaurant_table_path(restaurant, table)
  end


end

# session[:table] = params[:id]
# session[:order] = {[1,1]: 1}

