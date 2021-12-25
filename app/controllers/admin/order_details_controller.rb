class Admin::OrderDetailsController < ApplicationController

  before_action :authenticate_admin!

  def index
    @order = Order.find_by(params[:id])
    @order_details = @order.order_details
  end

  def update
    @order_detail = OrderDetail.find(params[:id])
    @order = @order_detail.order
    @order_detail.update(order_detail_params)

    if @order_detail.making_status == "製作中"
      # 注文ステータスを"製作中"に更新
      @order.update(status: 2)

    elsif @order_detail.making_status == "製作完了"
      
      @order_details = @order.order_details
      making_status_complete = @order_details.where(making_status: "製作完了")
      # .count→～の数
      if making_status_complete.count == @order_details.count
      # 注文ステータスを"発送準備中"に更新
      @order.update(status: 3)
      end
    # 遷移元のURLを取得
    redirect_to request.referer
    end
  end

  private

  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end

end
