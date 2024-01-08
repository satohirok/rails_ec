class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
    @latest_item = Item.order(created_at: :desc).all.where.not(item_id: @item.item_id)
  end

  def create
    @item = Item.new(item_params)
    @item.save!
  end

  def edit
  end

  private
  def item_params
    params.require(:item).permit(:item_id,:name,:price,:desription,:image)
  end
end
