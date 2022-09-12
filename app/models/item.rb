class Item < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :image
  belongs_to :genre

　def add_tax_sales_price
　  (self.sales_price * 1.10).round
　end
end
