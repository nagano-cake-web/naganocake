class Public::OrdersController < ApplicationController

  def index
    @customer = Customer.find(current_customer.id)
    @orders = @customer.orders.all
    @order = current_customer.orders.ids
  end

  def new
    @order = Order.new
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details.all
    @total = 0
  end

  def create
    @cart_items = current_customer.cart_items.all
    @order = current_customer.orders.new(order_params)
    if @order.save
      @cart_items.each do |cart|
        order_detail = OrderDetail.new
        order_detail.item_id = cart.item_id
        order_detail.order_id = @order.id
        order_detail.amount = cart.amount
        order_detail.price = @order.total_payment
        order_detail.save
      end
      redirect_to orders_complete_path
      @cart_items.destroy_all
    else
      @order = Order.new(order_params)
      render :new
    end
  end

  def comfirm
     @order = Order.new(order_params)
     @cart_items = current_customer.cart_items
     @order.shipping_cost = 800
    if params[:order][:select_address] == "1"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:select_address] == "2"
      if @address = Address.find(params[:order][:address_id])
        @order.postal_code = @address.postal_code
        @order.address = @address.address
        @order.name = @address.name
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
                                  :shipping_cost, :total_payment, :payment_method)
  end

  def address_params
    params.require(:order).permit(:name, :address, :postal_code)
  end

end
