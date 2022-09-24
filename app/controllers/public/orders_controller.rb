class Public::OrdersController < ApplicationController
  
  def new
    @customer = Customer.find()
  end
end
