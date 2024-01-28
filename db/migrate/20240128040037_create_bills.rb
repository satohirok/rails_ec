class CreateBills < ActiveRecord::Migration[7.0]
  def change
    create_table :bills do |t|
      t.string :last_name
      t.string :first_name
      t.string :user_name
      t.string :email
      t.string :main_adress
      t.string :sub_adress
      t.string :country
      t.string :region
      t.integer :zip_code
      t.string :credit_name
      t.integer :credit_number
      t.date :credit_valid
      t.integer :cvv

      t.timestamps
    end
  end
end
