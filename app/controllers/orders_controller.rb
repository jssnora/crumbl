class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order, only: [:show]

  def index
    @orders = Order.all.eager_load(:listing)
  end

  def show

  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

end
