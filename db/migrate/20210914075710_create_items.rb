class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :item do |t|
      t.string :name
      t.integer :price
      t.integer :quantity
      t.string :photo

      t.timestamps
    end
  end
end
