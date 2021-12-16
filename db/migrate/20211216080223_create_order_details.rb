class CreateOrderDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :order_details do |t|
      t.integer :amount
      t.integer :price
      t.integer :making_status

      t.timestamps
    end
  end
end