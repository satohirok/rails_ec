class Admin::ProductsController < ApplicationController
  def new
    @item = Item.new
  end

  def edit
    @item = Item.find(params[:id])
  end

  def index
    @items = Item.all
  end
end
