# frozen_string_literal: true

class OrdersController < ApplicationController
  http_basic_authenticate_with name: 'admin', password: 'pw'
  before_action :current_cart
  before_action :total_amount, only: %i[index show]

  def index
    @bill = Bill.all
  end

  def show
    @bill = Bill.find(params[:id])
    @order_items = @bill.orders
    @total_price = @order_items.sum(:item_total_price)
  end

  def new
    @bill = Bill.new
  end

  def create
    if Cart.check_cart_blank(@current_cart)
      flash[:notice] = 'カートに商品を追加してください'
      redirect_to carts_path
    elsif Order.check_out(@current_cart, bill_params)
      Cart.delete_cart_item(@current_cart)
      flash[:notice] = '購入ありがとうございます'
      redirect_to root_path
    else
      redirect_to carts_path
    end
  end

  private

  def bill_params
    params.permit(:last_name, :first_name, :user_name, :email, :main_address, :sub_address, :country, :region,
                  :zip_code, :credit_name, :credit_number, :credit_valid, :cvv)
  end

  def total_amount
    @total = @current_cart.item_carts.sum(:amount)
  end
end
