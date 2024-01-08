class Admin::ProductsController < ApplicationController
  http_basic_authenticate_with name: "admin", password: "pw"
  
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
