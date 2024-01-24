class CartsController < ApplicationController
  before_action :set_cart_item
  before_action :set_cart

  def index
    @total = ItemCart.where(cart_id: current_cart.id).sum(:amount)
    @items = Item.includes(:item_carts).where(item_carts: {cart_id: current_cart.id})
    @total_price = total_price(current_cart)
  end

  def destroy
    @item_cart = current_cart.item_carts.find(params[:id])
    @item_cart.destroy
    redirect_to carts_path
  end

  def add_item
    if @item_cart.blank?
      @item_cart ||= current_cart.item_carts.build(item_id: params[:item_id]) 
    end
    @item_cart.amount ||= 0
    @item_cart.amount += params[:amount].to_i
    if @item_cart.save
      redirect_to root_path ,notice: 'カートに商品を追加しました'
    else
      redirect_to admin_products_path
    end
  end

  private

  def set_cart_item
    @item_cart = current_cart.item_carts.find_by(item_id: params[:item_id])
  end

  def set_cart
    @cart = current_cart
  end

  def total_price(cart)
    cart.item_carts.includes(:item).sum { |item_cart| item_cart.amount * item_cart.item.price }
  end
end
