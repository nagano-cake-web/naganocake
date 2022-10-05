class Public::CartItemsController < ApplicationController
  def index
    @cart_items = Item.all
    @total = 0
    @cart_item = current_customer.cart_items
    @cart_items = CartItem.find(params[:id])
  end

  def updete
    cart_item = CartItem.find(params[:id])
    cart_item.update(cart_item_params)
    redirect_to cart_items_path(cart_item.id)
  end

  def destory
  end

  def destory_all
  end

  def create
     @cart_item = CartItem.new(cart_item_params)
    if Item.find_by(name: params[:id])
      cart_item += params[:item][:amout].to_i
      cart_item.save
      redirect_to items_path
    elsif @cart_item.save
      redirect_to items_path
    else
      redirect_to items_path
    end
  end

  private

  #編集などうまくいかない場合、permitにカラムを追加
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end
end
