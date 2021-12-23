class Customer::CustomersController < ApplicationController


  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      flash[:success] = "登録情報を編集しました。"
      redirect_to customers_path(current_customer)
    else
      flash[:alert] = "もう一度入力してください。"
      render :customer_edit
    end
  end

  def unsubscribe
  end

  def withdraw
    @customer = current_customer
    @customer.update(is_dele: false)
    reset_session
    redirect_to root_path
  end
end
