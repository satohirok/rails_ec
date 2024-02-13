# frozen_string_literal: true

class Promotion < ApplicationRecord
  def self.delete_applied_promotion(current_promotion)
    Promotion.find_by(id: current_promotion).destroy
  end
end
