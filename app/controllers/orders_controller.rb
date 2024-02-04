class OrdersController < ApplicationController
  http_basic_authenticate_with name: 'admin', password: 'pw'
  before_action :current_cart
  before_action :total_amount, only: [:index, :show]

  def index
    @bill = Bill.all
  end

  def show
    @bill = Bill.find(params[:id])
    @order_items = Order.where(bill_id: @bill.id)
    @total_price = @order_items.sum(:item_total_price)
  end

  def new
    @bill = Bill.new
  end

  def create
    @bill = Bill.new(bill_params)
    @order_item= Item.joins(:item_carts).select("items.item_id, items.name, items.price, item_carts.amount").where("item_carts.cart_id = ?", @current_cart.id)
    
    if @current_cart.item_carts.present?
      @bill.save

      @order_item.each do |item|
        order = Order.new(
          item_id: item.item_id,
          item_name: item.name,
          item_price: item.price,
          item_amount: item.amount,
          item_total_price: item.price * item.amount,
          bill: @bill  # 紐付ける
        )
        order.save
      end

      @item_carts = @current_cart.item_carts
      @item_carts.delete_all

      flash[:notice] = '購入ありがとうございます'
      redirect_to root_path
    else
      flash[:notice] = 'カートに商品を追加してください' 
      redirect_to carts_path
    end
  end

  private

  def bill_params
    params.permit(:last_name, :first_name, :user_name, :email, :main_address, :sub_address, :country, :region, :zip_code,:credit_name, :credit_number, :credit_valid, :cvv)
  end

  def total_amount
    @total = @current_cart.item_carts.sum(:amount)
  end
end
