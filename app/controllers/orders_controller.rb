class OrdersController < ApplicationController
  def show
    @order = current_user.orders.find(params[:id])
  end

  def create
    # @order = Order.create!(state: 'pending', user: current_user)
  end
end
