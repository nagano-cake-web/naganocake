class Order < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable


  has_many :order_datail, dependent: :destroy
  belongs_to :customer
end
