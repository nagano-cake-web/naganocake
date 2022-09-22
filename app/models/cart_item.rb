class CartItem < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable


  belongs_to :item
  belongs_to :customer
  
  def subtotal
    item.add_tax_price * amount
  end
  
end
