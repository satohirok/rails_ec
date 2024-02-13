# frozen_string_literal: true

class CreateApplies < ActiveRecord::Migration[7.0]
  def change
    create_table :applies do |t|
      t.string :applied_code
      t.integer :applied_discount_rate
      t.references :bill, foreign_key: true

      t.timestamps
    end
  end
end
