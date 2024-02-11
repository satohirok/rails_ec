# frozen_string_literal: true

class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :item_id
      t.string :name
      t.integer :price
      t.string :description

      t.timestamps
    end
  end
end
