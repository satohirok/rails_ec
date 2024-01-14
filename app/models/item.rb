class Item < ApplicationRecord
  has_one_attached :image
  has_many :item_carts
  has_many :items, through: :item_carts
end
