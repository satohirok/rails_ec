# frozen_string_literal: true

class PromotionsController < ApplicationController
  before_action :current_cart

  def create
    if @current_cart.check_blank?
      flash[:notice] = 'カートに商品を追加してください'
    elsif Promotion.exists?(code: promotion_params[:code])
      promotion = Promotion.find_by(code: promotion_params[:code])
      applid promotion
    else
      flash[:notice] = '入力されたプロモーションコードは無効です'
    end
    redirect_to carts_path
  end

  def destroy
    session[:promotion_id] = nil
    redirect_to carts_path
  end

  private

  def promotion_params
    params.permit(:code, :discount_rate)
  end
end
