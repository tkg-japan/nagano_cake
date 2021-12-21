class Admin::OrdersController < ApplicationController
  
  before_action :authenticate_admin!
  
  def index
    @orders = Order.all
  end
  
  def update
    @order = Order.find(params[:id])
    # p order_params[:order_status]　←？
    @order.update(order_status: order_params[:order_status].to_i)
    # p @order.order_status　←？
    if @order.order_status == "入金確認"
      @order.order_details.each do |order_detail|
        # 製作ステータスを"製作待ち"に更新
        order_detail.update(making_status: 1)
      end
    end
    # 遷移元のURLを取得
    redirect_to request.referer
  end

  # private

  # def order_params
  #   params.require(:order).permit(:order_status)
  # end
end
