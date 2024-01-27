# frozen_string_literal: true

class Cart < ApplicationRecord
  has_many :item_carts, dependent: :destroy
  has_many :items, through: :item_carts

  def total_price
    ItemCart.includes(:item).where(cart_id: id).sum { |item_cart| item_cart.amount * item_cart.item.price }
  end

  def total
    ItemCart.where(cart_id: id).sum(:amount)
  end
end
