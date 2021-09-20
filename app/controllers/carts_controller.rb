class CartsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]

  def show
    raw_data = request.body.read

    if raw_data.empty?
      @cart_objects = []
    else
      data = JSON.parse(data)
        cart_object = JSON.parse(raw_data)
        # [{"itemId"=>"5", "itemCount"=>"5"}]
        @cart_objects = cart_object.map do |cart_item|
          item = Item.find(cart_item['itemId'])
          {
            item_id: item.id,
            item_name: item.name,
            item_count: cart_item['itemCount'],
            item_price: item.price * cart_item['itemCount'].to_i
          }
        end
    end
    respond_to do |format|
      format.html
    end
  end

  def destroy
    @item = Item.find(params[:item_id])
    @item.destroy
  end
end
