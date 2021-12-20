class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @orders = Order.all
  end
  
  def show
    @customer = Customer.find(params[:id])
    @orders = Order.all
  end
  
  def update
  end
end
