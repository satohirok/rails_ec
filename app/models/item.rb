# frozen_string_literal: true

class Item < ApplicationRecord
  has_one_attached :image
  has_many :item_carts, dependent: :destroy
  has_many :carts, through: :item_carts
end
