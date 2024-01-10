# frozen_string_literal: true

module Admin
  class ProductsController < ApplicationController
    http_basic_authenticate_with name: 'admin', password: 'pw'

    def new
      @item = Item.new
    end

    def edit
      @item = Item.find(params[:id])
    end

    def index
      @items = Item.all
    end

    def create
      @item = Item.new(item_params)
      @item.save!
      redirect_to admin_products_path
    end

    def update
      item = Item.find(params[:id])
      item.update!(item_params)
      redirect_to admin_products_path
    end

    def destroy
      item = Item.find(params[:id])
      item.destroy
      redirect_to admin_products_path
    end

    private

    def item_params
      params.require(:item).permit(:item_id, :name, :price, :description, :image)
    end
  end
end
