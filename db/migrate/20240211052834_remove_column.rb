# frozen_string_literal: true

class RemoveColumn < ActiveRecord::Migration[7.0]
  def change
    remove_column :promotions, :bill_id, :bigint
  end
end
