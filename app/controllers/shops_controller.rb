class ShopsController < ApplicationController
  def index
    @shops = Shop.where(postal_code: params[:postal_code])
    @items = Item.where(shop_id: @shops)
  end
end
