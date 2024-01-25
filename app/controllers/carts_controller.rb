# frozen_string_literal: true

class CartsController < ApplicationController
  before_action :set_cart_item
  before_action :current_cart

  def index
    @total = Cart.total(@current_cart)
    @items = Item.includes(:item_carts).where(item_carts: { cart_id: @current_cart.id })
    @total_price = Cart.total_price(@current_cart)
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
    @item_cart = current_cart.item_carts.find_by(item_id: params[:item_id])
  end
end
