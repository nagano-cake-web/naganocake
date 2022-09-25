class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
    @orders = Order.all
    @customer = Customer.find(params[:id])
  end
end
