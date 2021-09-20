class AddDetailToOrder < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :detail, :string
  end
end
