class Order < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable


  has_many :order_datails, dependent: :destroy
  belongs_to :customer

  enum payment_method: { credit_card: 0, transfer: 1 }
  enum address_number: { customer_address: 0,  addresses: 1,  new_address: 2}


  def subtotal
    item.add_tax_price * amount
  end


end
