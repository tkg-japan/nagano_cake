class Customer::CustomersController < ApplicationController


  def show
    @customer = Customer.find(params[:id])
  end

  def edit
  end

  def unsubscribe
    @customer = Customer.find_by(name: params[:email])
    @customer.update(is_valid: false)
    reset_session
    redirect_to root_path
  end
end
