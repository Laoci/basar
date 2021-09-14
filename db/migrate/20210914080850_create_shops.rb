class CreateShops < ActiveRecord::Migration[6.1]
  def change
    create_table :shops do |t|
      t.string :name
      t.string :photo
      t.integer :postal_code
      t.string :address
      t.integer :phone_number

      t.timestamps
    end
  end
end
