class CartItemsController < ApplicationController

  before_action :authenticate_customer!

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    @cart_item.save
    redirect_to cart_items_path
  end

  def index
<<<<<<< HEAD
    # ログインしている会員の全てのカート内商品
=======
>>>>>>> 94268786af130c620b57ff9c38fba4b05f010634
    @cart_items = current_customer.cart_items.all
    @total = 0
  end

  def update
    @cart_item = current_customer.cart_items.find(params[:id])
    @cart_item.update(cart_item_params)
      # 遷移元のURLを取得
      redirect_to request.referer
  end

  def destroy
    @cart_items = current_customer.cart_items.find(params[:id])
    @cart_items.destroy
    # 遷移元のURLを取得
    redirect_to request.referer
  end

  def destroy_all
    @cart_items = current_customer.cart_items
    @cart_items.destroy_all
    redirect_to request.referer
  end

  private

  def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount)
  end



end
