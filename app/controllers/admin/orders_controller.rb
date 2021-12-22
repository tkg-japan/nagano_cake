class Admin::OrdersController < ApplicationController

  before_action :authenticate_admin!

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find_by(params[:id])
    @order_details = @order.order_details
  end

  def update
    @order = Order.find(params[:id])
    # @order.update(order_params)
    @order.update(order_params)

    if @order.status == "入金確認"
      # flash[:notice] = "作り始めよう！"
      @order.order_details.update(making_status: "製作準備")

    elsif @order.status == "発送済み"
      # flash[:notice] = "頑張ったね！"
    end

    redirect_to request.referer

  end

  # def update
  #   @order = Order.find(params[:id])
  #   # p order_params[:order_status]　←？
  #   @order.update(status: params[:status].to_i)
  #   # p @order.order_status　←？
  #   if @order.status == "入金確認"
  #     @order.order_details.each do |order_detail|
  #       # 製作ステータスを"製作待ち"に更新
  #       order_detail.update(making_status: 1)
  #     end
  #   end
  #   # 遷移元のURLを取得
  #   redirect_to request.referer
  # end

  private

  def order_params
    params.require(:order).permit(:status)
  end
end
