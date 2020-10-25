class RemoveProductFromOrders < ActiveRecord::Migration[5.2]
  def change
    remove_reference :orders, :products, foreign_key: true
  end
end
