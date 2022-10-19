class Public::OrdersController < ApplicationController

  def index
    @orders = Order.all
  end

  def new
    @order = Order.new
  end

  def show
    @order_detail = OrderDetail.all
    @order = Order.all
  end

  def create
    @cart_items = current_customer.cart_items.all
    @order = current_customer.orders.new(order_params)
    @order.shipping_cost = 800
    if @order.save
      @cart_items.each do |cart|
        order_detail = OrderDatail.new
        order_detail.item_id = cart.item_id
        order_detail.order_id = @order.id
        order_detail.order_amount = cart.amount
        order_detail.order_price = cart.item.price
        order_detail.save
      end
      redirect_to orders_complete_path
      cart_items.destroy_all
    else
      @order = Order.new(order_params)
      render :new
    end
  end

  def comfirm
     @order = Order.new(order_params)
     @cart_items = current_customer.cart_items
     @order.shipping_cost = 800
     @address = Address.find(params[:order][:address_id])
    if params[:order][:select_address] == "1"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:select_address] == "2"
      @address = Address.find(params[:order][:address_id])
      if Address.exists?(name: params[:order][:address_id])
        @order.name = Address.find(params[:order][:address_id]).name
        @order.address = Address.find(params[:order][:address_id]).address
      else
        render :new
      end
    elsif  params[:order][:select_address] == "3"
      address_new = current_customer.addresses.new(address_params)
      if address_new.save
      else
        render :new
      end
    end
  end

  def complete

  end

  private

  def order_params
    params.require(:order).permit(:customers_id, :postal_code, :address, :name,
                                  :shipping_cost,:total_payment, :payment_method, :status)
  end
end
