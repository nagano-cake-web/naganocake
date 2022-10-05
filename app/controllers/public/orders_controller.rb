class Public::OrdersController < ApplicationController

  def index
    @orders = Order.all
  end

  def new
    @order = Order.new
    @customer = Customer.find(params[:id])
  end

  def create
    order = Order.new(order_params)
    order.save
    redirect_to new_order_path(current_user.id)
  end

  def show
    @order = Order.find(params[:id])
    @order = Order.all
  end

  def comfirm
    @order = Order.new(order_params)
    @address = Address.find(params[:order][:address_id])
    @order.postal_code = @address.postal_code
    @order.address = @address.address
    @order.name = @address.name
  end

  def complete
    cart_items = current_customer.cart_items.all
    @order = current_customer.orders.new(order_params)
    if @order.save
      cart_items.each do |cart|
        order_item = OrderItem.new
        order_item = @order.id
        order_item.amount = cart.amount
        order_item.total_payment = cart.item.price
        order_item.save
      end
      redirect_to
      cart_items.destroy_all
    else
      @order = Order.new(order_params)
      render :new
    end
  end

  private

  def order_params
    params.require(:order).permit(:customers_id, :postal_code, :address, :name,
                                  :shipping_cost,:total_payment, :payment_method, :status)
  end
end
