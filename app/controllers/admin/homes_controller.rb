class Admin::HomesController < ApplicationController
  def index
    @homes = Order.all
  end
end
