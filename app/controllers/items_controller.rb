class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
    @latest_item = Item.order(updated_at: :desc).all.where.not(item_id: @item.item_id)
  end
end
