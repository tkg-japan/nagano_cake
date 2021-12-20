class Admin::ItemsController < ApplicationController


  def new
    @item = Item.new
    @genres = Genre.all
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_item_path(@item.id), notice: "いいーね!!"
    else
      # frash.now[:alert] = "もう一度入力し直してください。"
      render "index"
    end

  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
    flash[:notice] = "商品情報を編集したよ。"
    redirect_to admin_item_path(item.id)

  end

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])

  end

  def edit
    @genres = Genre.all
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:name, :explanation, :image, :price, :genre_id, :is_active)
  end

end
