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
  end

  def confilm
  end


   private
  def order_params
    params.require(:order).permit(:payment_method, :postcode, :address, :name)
  end

  # def products_exists?
  #   if current_customer.cart_products.blank?
  #     redirect_to products_path
  #     flash[:alert] = "カートに商品を入れてね"
  #   end
  # end

end
