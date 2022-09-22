class Public::CartItemsController < ApplicationController
  def index
    @cart_items = Item.all
    @total = 0
    @cart_item = CartItem.find(params[id])
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
  end

  private

  #編集などうまくいかない場合、permitにカラムを追加
  def cart_item_params
    params.require(:cart_item).permit(:amount)
  end
end
