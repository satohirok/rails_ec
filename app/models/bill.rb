# frozen_string_literal: true

class Bill < ApplicationRecord
  has_many :orders, dependent: :destroy
  has_one :apply, dependent: :destroy
end