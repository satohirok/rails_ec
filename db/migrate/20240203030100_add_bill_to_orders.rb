# frozen_string_literal: true

class AddBillToOrders < ActiveRecord::Migration[7.0]
  def change
    add_reference :orders, :bill, null: true, foreign_key: true
  end
end
