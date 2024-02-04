class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :item_id
      t.string :item_name
      t.integer :item_price
      t.integer :item_amount
      t.integer :item_total_price
      t.integer :total_price

      t.timestamps
    end
  end
end
