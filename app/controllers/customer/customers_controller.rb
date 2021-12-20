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
      flash[:notice] = "登録情報を編集しました。"
      redirect_to customers_path(current_customer)
    else
      flash[:alert] = "もう一度入力してください。"
      render :customer_edit
    end
  end

  def unsubscribe
    @customer = Customer.find_by(name: params[:email])
  end

  def withdraw
    @customer = Customer.find_by(name: params[:email])
    @customer.update(is_valid: false)
    reset_session
    redirect_to root_path
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postcode, :address, :phone_number, :email)
  end
end
