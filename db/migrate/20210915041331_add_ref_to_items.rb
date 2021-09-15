class AddRefToItems < ActiveRecord::Migration[6.1]
  def change
    add_reference :items, :shop, foreign_key: true
  end
end
