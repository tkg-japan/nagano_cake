class OrdersController < ApplicationController
  def index
    @orders = Order.where(customer_id: current_customer.id)
  end

  def show
    @order = Order.find(params[:id])
    @orders = OrderDetail.find(params[:id])
  end

  def new
    @order = Order.new
  end

  def complete
  end

  def create
    @orders = Order.new(confirm_params)
    @orders.save
  end

  def confilm
  end


 private

  def order_params
    params.require(:order).permit(:payment_method, :postcode, :address, :name)
  end

end
