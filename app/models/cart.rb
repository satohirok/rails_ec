# frozen_string_literal: true

class Cart < ApplicationRecord
  has_many :item_carts, dependent: :destroy
  has_many :items, through: :item_carts

  def self.total_price(cart)
    cart.item_carts.includes(:item).sum { |item_cart| item_cart.amount * item_cart.item.price }
  end

  def self.total(cart)
    ItemCart.where(cart_id: cart.id).sum(:amount)
  end
end
