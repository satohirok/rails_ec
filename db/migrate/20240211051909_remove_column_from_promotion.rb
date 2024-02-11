class RemoveColumnFromPromotion < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :promotions, :bills
  end
end
