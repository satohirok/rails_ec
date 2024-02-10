class CreatePromotions < ActiveRecord::Migration[7.0]
  def change
    create_table :promotions do |t|
      t.string :code
      t.integer :discount_rate
      t.boolean :applied, default: false
      
      t.timestamps
    end
  end
end
