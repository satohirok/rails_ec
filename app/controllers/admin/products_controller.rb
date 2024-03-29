# frozen_string_literal: true

module Admin
  class ProductsController < ApplicationController
    http_basic_authenticate_with name: 'admin', password: 'pw'
    before_action :current_cart
    before_action :total_amount, only: %i[index new edit]

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

    def total_amount
      @total = @current_cart.item_carts.sum(:amount)
    end
  end
end
