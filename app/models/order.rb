# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :bill

  def self.check_out(cart, bill_params)
    ActiveRecord::Base.transaction do
      bill = Bill.new(bill_params)
      return false unless bill.save

      order_items = Item.joins(:item_carts).select('items.item_id, items.name, items.price, item_carts.amount').where(
        'item_carts.cart_id = ?', cart.id
      )
      order_items.each do |item|
        order = Order.new(
          item_id: item.item_id,
          item_name: item.name,
          item_price: item.price,
          item_amount: item.amount,
          item_total_price: item.price * item.amount,
          bill:
        )
        order.save!
      end
      CheckoutMailer.confirm_mail(bill, bill.orders).deliver
      true
    end
  end
end
