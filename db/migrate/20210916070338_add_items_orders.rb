class AddItemsOrders < ActiveRecord::Migration[6.1]
  def change
      create_table :orders do |t|
        t.string :state
        t.monetize :amount, currency: { present: false }
        t.string :checkout_session_id
        t.references :user, null: false, foreign_key: true

        t.timestamps
      end

    create_table :item_orders do |t|
      t.references :order, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true

      t.timestamps
    end
  end
end
