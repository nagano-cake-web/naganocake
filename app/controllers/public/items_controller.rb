class Public::ItemsController < ApplicationController

  def index
    @items = Item.all
    @item = Item.page(params[:page])
    @genre = Genre.all
  end

  def show
    @genre = Genre.all
    @item = Item.find(params[:id])
    @customer = Customer.find(params[:id])
    @cart_item = CartItem.new
  end



  private

  def item_params
    params.require(:item).permit(:genre_id, :name, :introduction, :price, :is_active)
  end
end
