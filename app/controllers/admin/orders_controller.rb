class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(paramd[:id])
    @orders = Order.all
    @order_payment =
  end
end
