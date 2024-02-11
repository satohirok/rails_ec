class PromotionsController < ApplicationController
  before_action :current_cart

  def create
    if @current_cart.check_blank?
      flash[:notice] = 'カートに商品を追加してください'
      redirect_to carts_path
    elsif Promotion.exists?(code: promotion_params[:code])
      promotion = Promotion.find_by(code: promotion_params[:code])
      applid promotion
      redirect_to carts_path
    else
      flash[:notice] = '入力されたプロモーションコードは無効です'
      redirect_to carts_path
    end
  end

  def destroy
    session[:promotion_id] = nil
    redirect_to carts_path
  end

  private
  def promotion_params
    params.permit(:code,:discount_rate)
  end
end
