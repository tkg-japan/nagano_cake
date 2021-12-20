class Customer::CustomersController < ApplicationController


  def show
    @customer = current_customer
  end

  def edit
  end

  def unsubscribe
  end

  def withdraw
    @customer = current_customer
    @customer.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end
end
