class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order, only: [:show]
  before_action :authorise_user, only: [:show]

  def index
    @orders = Order.all
  end

  def show

  end

  private

  def authorise_user
    if @order.buyer_id != current_user.id
      redirect_to listings_path, alert: "You don't have permission to do that"
    end
  end

  def set_order
    @order = Order.find(params[:id])
  end

end
