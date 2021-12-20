class Admin::ItemsController < ApplicationController


  def new
    @item = Item.new
    @genres = Genre.all
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_items_path(@item.id), notice: "いいーね!!"
    else
      # frash.now[:alert] = "もう一度入力し直してください。"
      render "index"
    end

  end

  def updated
  end

  def index
    @items = Item.all
  end

  def show
  end

  def edit
  end

  private

  def item_params
    params.require(:item).permit(:name, :explanation, :image_id, :price, :genre_id, :is_active)
  end

end
