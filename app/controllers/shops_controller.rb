class ShopsController < ApplicationController
  def index
    @shops = Shop.where(postal_code: params[:postal_code])
  end
end
