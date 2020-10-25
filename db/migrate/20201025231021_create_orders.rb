class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.float :total
      t.integer :payment_type
      t.string :order_hash
      t.references :products, foreign_key: true

      t.timestamps
    end
  end
end
