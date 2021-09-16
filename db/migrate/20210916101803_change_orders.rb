class ChangeOrders < ActiveRecord::Migration[6.1]
  def change
    change_table :orders do |t|
      t.string :state
      t.monetize :amount, currency: { present: false }
      t.string :checkout_session_id
    end
  end
end
