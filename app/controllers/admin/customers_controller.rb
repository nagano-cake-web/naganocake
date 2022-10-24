class Admin::CustomersController < ApplicationController
  def index
    @customer = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    customer = Customer.find(params[:id])
    customer.update(customer.params)
    redirect_to admin_customer_path(customer.id)
  end

  private

  def customer_params
    params.require(:customer).permit(:id, :last_name, :last_name, :first_name, :last_name_kana, :first_name_kana, :email, :encrypted_password, :postal_code, :address, :telephone_number, :is_active, :created_at, :updated_at)
  end

end

