# frozen_string_literal: true

class ItemsController < ApplicationController
  before_action :current_cart
  before_action :total_amount
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
    @latest_item = Item.order(updated_at: :desc).all.where.not(id: @item.id)
  end

  private

  def total_amount
    @total = @current_cart.item_carts.sum(:amount)
  end
end
