class CartItemsController < ApplicationController
  
  before_action :authenticate_customer!
  
  def index
    @cart_items = CartItem.all
    @order = Order.new
    
    # @total = 0
    # @cart_products.all.sum(:quantity)
    # @products = CartProduct.all
  end

  def create
  end

  def update
  end

  def destroy
  end
end
