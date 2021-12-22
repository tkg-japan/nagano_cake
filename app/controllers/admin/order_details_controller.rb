class Admin::OrderDetailsController < ApplicationController

  before_action :authenticate_admin!

  def index
    @order = Order.find_by(params[:id])
    @order_details = @order.order_details
  end

  def update
    # making_statusでどのボタンが押されたかを特定する
    @order_detail = OrderDetail.find(params[:id])
    # 注文商品から注文テーブルの呼び出し
    @order = @order_detail.order
    # 製作ステータスの更新はmaking_statusだけのデータ取得が必要。to_iではいってくるデータをintegerにする
    @order_detail.update(making_status: params[:order_detail][:making_status].to_i)

    # p @order_detail ←？？
    if @order_detail.making_status == "製作中"
      # 注文ステータスを"製作中"に更新
      @order.update(order_status: 2)

    elsif @order_detail.making_status == "製作完了"
    # elsif @order.order_details.count == @order.order_details.where(making_status: 3).count
      # 注文ステータスを"発送準備中"に更新
      @order.update(order_status: 3)
    end
    # 遷移元のURLを取得
    redirect_to request.referer
  end

  private

  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end

end
