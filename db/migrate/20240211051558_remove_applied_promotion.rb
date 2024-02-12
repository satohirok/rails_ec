# frozen_string_literal: true

class RemoveAppliedPromotion < ActiveRecord::Migration[7.0]
  def change
    remove_reference :applied_promotions, :order, foreign_key: true
    remove_reference :applied_promotions, :promotion, foreign_key: true
  end
end
