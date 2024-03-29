# frozen_string_literal: true

class CreateItemCarts < ActiveRecord::Migration[7.0]
  def change
    create_table :item_carts do |t|
      t.references :item, null: false, foreign_key: true
      t.references :cart, null: false, foreign_key: true
      t.integer :amount

      t.timestamps
    end
  end
end
