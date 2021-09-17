class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :name
      t.monetize :price, currency: { present: false }
      t.integer :quantity
      t.string :photo

      t.timestamps
    end
  end
end
