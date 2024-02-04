class RenameSubAdressColumnToBills < ActiveRecord::Migration[7.0]
  def change
    rename_column :bills, :sub_adress, :sub_address
  end
end
