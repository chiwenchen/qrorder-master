class OrdersController < ApplicationController
  def change_order_status
    @order = Order.find(params[:id])
    if params[:status] == "cooked"
      @order.status = "Cooked"
    elsif params[:status] == 'served'
      @order.status = "Served"
    end
    @order.save
    respond_to do |format|
      format.js
    end
  end
end
