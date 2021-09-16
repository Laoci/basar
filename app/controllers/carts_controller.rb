class CartsController < ApplicationController
  def show

     data = JSON.parse(request.body.read)
     cart_object = JSON.parse(data)
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
    respond_to do |format|
      format.html
    end
  end
end
