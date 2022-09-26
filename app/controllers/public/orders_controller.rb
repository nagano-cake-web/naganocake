class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
    @customer = Customer.find(params[:id])
  end

  def create
    order = Order.new(order_params)
    order.save
    redirect_to new_order_path(current_user.id)
  end

  def confirm
    @order = Order.new(order_params)
    @address = Address.find(params[:order][:address_id])
    @order.postal_code = @address.postal_code
    @order.address = @address.address
    @order.name = @address.name
  end

  private

  def order_params
    params.require(:order).permit(:postal_code, :address, :name, :shipping_cost,
                                  :total_payment, :payment_method, :status)
  end
end
