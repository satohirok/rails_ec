class Admin::ProductsController < ApplicationController
  def new
  end

  def edit
  end

  def index
    @items = Item.all
  end
end
