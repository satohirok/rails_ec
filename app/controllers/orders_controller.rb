class OrdersController < ApplicationController
  def index
  end

  def show
  end

  def create
    @bill = Bill.create(bill_params)
    if @bill.save
      flash[:notice] = '購入ありがとうございます'
      redirect_to root_path
    else
      puts @bill.errors.full_messages
      render :new
    end
  end

  private

  def bill_params
    params.permit(:last_name, :first_name, :user_name, :email, :main_adress, :sub_adress, :country, :region, :zip_code,:credit_name, :credit_number, :credit_valid, :cvv)
  end
end
