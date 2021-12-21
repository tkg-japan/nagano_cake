class OrdersController < ApplicationController
  def index
  end

  def show
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
