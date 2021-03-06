class ItemsController < ApplicationController

  def index
    @genres = Genre.all
    @items = Item.all
  end

  def show
    @genres = Genre.all
    @items = Item.all
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end
end
