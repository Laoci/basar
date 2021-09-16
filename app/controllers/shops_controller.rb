class ShopsController < ApplicationController
  def index
    postal_code = params[:postal_code]
    @shops = Shop.where(postal_code: postal_code)
    @items = Item.where(shop_id: @shops)

    # Not a number or not exactly 6 digits
    unless Integer(postal_code, exception: false) && postal_code.length == 6
      alert = "Invalid Postal Code '#{postal_code}', please enter 6 digits."
      redirect_to '/', alert: alert
      return
    end

    # No results, show notify
    if @shops.count.zero?
      redirect_to '/', alert: "No results found for '#{postal_code}'"
      return
    end
  end
end
