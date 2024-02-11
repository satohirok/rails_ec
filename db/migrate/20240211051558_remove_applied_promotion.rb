class RemoveAppliedPromotion < ActiveRecord::Migration[7.0]
  def change
    drop_table :applied_promotions
  end
end
