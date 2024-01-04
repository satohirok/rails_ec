class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
    @latest_item = Item.order(created_at: :desc).all
  end

  def new
  end

  def edit
  end
end
