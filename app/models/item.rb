class Item < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable


  has_one_attached :image
  has_many :order_datail, dependent: :destroy
  has_many :cart_item, dependent: :destroy
  belongs_to :genre

  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io:File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end

  def add_tax_price
    (self.price * 1.10).floor
  end
end
