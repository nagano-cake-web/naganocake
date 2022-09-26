class Address < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable


  belongs_to :customer

  def address_display
    '〒' + postal_code + '' + address + '' + name
  end
end