class Public::ItemsController < ApplicationController

  def index
    @items = Item.all
    @genre = Genre.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(item_params)
    item.save
    redirect_to items_path
  end

end
