# frozen_string_literal: true

class ApplicationController < ActionController::Base
  helper_method :current_cart, :current_promotion
  include PromotionsHelper

  # session情報に紐づくcart_idをメソッド化
  # application_controllerに記述することで全てのコントローラーから呼び出せるようにする
  private

  def current_cart
    # sessionが保持されている場合はそのsessionと一致するcart_idをCartテーブルから抽出し変数に代入
    @current_cart = Cart.find_by(id: session[:cart_id])
    # sessionが保持されていない場合は新たにCartオブジェクト(cart_id)を作成
    @current_cart ||= Cart.create
    # 上記で作成されたcart_idをセッション情報に保持
    session[:cart_id] = @current_cart.id
  end
end
