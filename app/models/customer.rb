class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable


  has_many :address, dependent: :destroy
  has_many :cart_item, dependent: :destroy
  has_many :orders, dependent: :destroy
end
