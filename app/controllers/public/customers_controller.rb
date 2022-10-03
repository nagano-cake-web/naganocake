class Public::CustomersController < ApplicationController

  def show
    @customer = Customer.find(current_customer.id)
  end

  def edit
    @customer = Customer.find(current_customer.id)
  end

  def update
    @customer = Customer.find(current_customer.id)
    customer.save
    redirect_to customer_path(customer.id)
  end

  def unsubscribe
    @customer = Customer.find_by(email: params[:customer][:email])
  end

  def withdraw
    @customer = Customer.find_by(email: params[:customer][:email])
    @customer.update(is_deleted: false)
    reset_session
    redirect_to root_path
  end

  private

  def customer_paramd
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana,
                                     :email, :postal_code, :address, :telephone_number)
  end
end
