class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:show, :create]

  def show
    @order = current_user.orders.find(params[:id])
  end

  def create
    # get total amount of the order

    amount = 0
    JSON.parse(params[:cart_objects]).each do |item_hash|
      amount += item_hash["item_price"].to_f * item_hash["item_count"].to_i
    end
    # create a new order instance
    @mapping = {}
    @order = Order.create!(state: 'pending', user: current_user, amount_cents: amount * 100)
    JSON.parse(params[:cart_objects]).each do |item_hash|
      item = Item.find(item_hash["item_id"])
      if item
        @order.items << item
        @mapping[item.id] = item_hash["item_count"].to_i
      end
    end
    # create a session
    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: @order.items.map { |item| { name: item.name, images: [item.photo], amount: item.price_cents, currency: 'sgd', quantity: @mapping[item.id] } },
      success_url: order_url(@order),
      cancel_url: order_url(@order)
    )
    # update the order instance
    @order.update(checkout_session_id: session.id)
    redirect_to session.url
  end
end
