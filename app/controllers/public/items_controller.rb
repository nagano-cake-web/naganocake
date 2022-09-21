class Public::ItemsController < ApplicationController

  def index
    @items = Item.all
    @genre = Genre.all
  end

end
