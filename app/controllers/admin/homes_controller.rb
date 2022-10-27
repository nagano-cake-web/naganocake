class Admin::HomesController < ApplicationController
  def top
    @orders = Order.all
    @order_details = OrderDetail.all
  end

  private

  def order_params
    params.require(:order).permit(:order.id)
  end

end
