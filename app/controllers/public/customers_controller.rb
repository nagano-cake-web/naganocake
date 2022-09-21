class Public::CustomersController < ApplicationController

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    customer.save
    redirect_to customer_path(customer.id)
  end

  private

  def customer_paramd
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana,
                                     :email, :postal_code, :address, :telephone_number)
  end
end
