class AddBillToPromotion < ActiveRecord::Migration[7.0]
  def change
    add_reference :promotions, :bill, null: true, foreign_key: true
  end
end
