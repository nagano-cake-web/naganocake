class Public::ItemsController < ApplicationController

  def index
    @items = Item.all
    @genre = Genre.all
  end

  def show
    @genre = Genre.all
    @item = Item.find(params[:id])
    @customer =Customer.find(current_customer.id)
    @cart_item = CartItem.new
  end

  #未完成
  def create
    @item = Item.new(item_params)
    if Item.find_by(name: params[:id])
      b
      item += params[:item][:amout].to_i
      item.save
      redirect_to items_path
    elsif @item.save
      redirect_to items_path
    else
      redirect_to items_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:genre_id, :name, :introduction, :price, :is_active)
  end
end
