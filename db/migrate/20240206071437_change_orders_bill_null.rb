class ChangeOrdersBillNull < ActiveRecord::Migration[7.0]
  def up
    change_column_null :orders, :bill_id, true
  end
  def down
    change_column_null :orders, :bill_id, false
  end
end
