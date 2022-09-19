class Item < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable


  has_one_attached :image
  has_many :order_datail, dependent: :destroy
  has_many :cart_item, dependent: :destroy
  

  def add_tax_price
    (self.price * 1.10).floor
  end
end
