class Public::ItemsController < ApplicationController

  def index
    @items = Item.all
    @genre = Genre.all
  end

  def show
    @item = Item.find(params[:id])
  end

  #未完成
  def create
    @item = Item.new(item_params)
    if Item.find_by(name: params[:id])
      item += params[:item][:amout].to_i
      item.save
      redirect_to items_path
    elsif @item.save
      redirect_to items_path
    else
      redirect_to items_path
    end
  end

end
