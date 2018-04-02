class AccountStocks < ActiveRecord::Migration[5.1]
  def change
    create_table :account_stocks do |t|
      t.integer :account_id
      t.integer :stock_id
    end
  end
end
