# frozen_string_literal: true

module PromotionsHelper
  def applid(promotion)
    session[:promotion_id] = promotion.id
  end

  def current_promotion
    return unless session[:promotion_id]

    @current_promotion ||= Promotion.find_by(id: session[:promotion_id])
  end

  def applied?
    !current_promotion.nil?
  end
end
