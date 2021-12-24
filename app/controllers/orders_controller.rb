class OrdersController < ApplicationController
  def index
    @orders = Order.where(customer_id: current_customer.id)
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
  end


  def create
    @orders = Order.new(order_params)
    @orders.customer_id = current_customer.id
    @orders.save

    current_customer.cart_items.each do |item|
      @item = OrderDetail.new
      @item.item_id = item.item_id
      @item.amount = item.amount
      @item.price = item.item.add_tax_price
      @item.order_id = @orders.id
      @item.making_status = '着手不可'
      @item.save
   end

    current_customer.cart_items.destroy_all
    redirect_to complete_orders_path
  end

  def confirm
    @order = Order.new(order_params)

    if params[:order][:address_number] == "0"
      @order.postcode = current_customer.postcode
      @order.address = current_customer.address
      @order.name = current_customer.first_name+current_customer.last_name

    elsif  params[:order][:address_number] == "1"
      @addresses = Address.find(params[:order][:address_id])
      @order.postcode = @addresses.postcode
      @order.address = @addresses.address
      @order.name = @addresses.name

    else params[:order][:address_number] == '2'
    end

    @item = current_customer.cart_items
    @total = 0
  end


 private

  def order_params
    params.require(:order).permit(:payment_method, :postcode, :name, :address, :shipping_cost, :status, :customer_id, :total_payment )
  end

end
