class OrdersController < ApplicationController
  def change_order_status
    @order = Order.find(params[:id])
    @order.status = true
    @order.save
    respond_to do |format|
      format.js
    end
  end
end
