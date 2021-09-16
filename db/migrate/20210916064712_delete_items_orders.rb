class DeleteItemsOrders < ActiveRecord::Migration[6.1]
  def change
    drop_table :item_orders
  end
end
