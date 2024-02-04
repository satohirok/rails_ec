class RenameMainAdressColumnToBills < ActiveRecord::Migration[7.0]
  def change
    rename_column :bills, :main_adress, :main_address
  end
end
