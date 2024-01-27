# frozen_string_literal: true

class CartsController < ApplicationController
  before_action :current_cart
  before_action :set_cart_item
  
  def index
    @total = @current_cart.total
    @items = @current_cart.items.includes(:item_carts)
    @total_price = @current_cart.total_price
  end

  def destroy
    @item_cart = @current_cart.item_carts.find(params[:id])
    @item_cart.destroy
    redirect_to carts_path
  end

  def create
    @item_cart ||= @current_cart.item_carts.build(item_id: params[:item_id]) if @item_cart.blank?
    @item_cart.amount ||= 0
    @item_cart.amount += params[:amount].to_i
    if @item_cart.save
      redirect_to root_path
    else
      redirect_to admin_products_path
    end
  end

  private

  def set_cart_item
    @item_cart = @current_cart.item_carts.find_by(item_id: params[:item_id])
  end
end
