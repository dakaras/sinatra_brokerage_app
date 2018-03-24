class CreateStocks < ActiveRecord::Migration[5.1]
  def change
    create_table :stocks do |t|
      t.string :name
      t.string :ticker
      t.integer :account_id
      t.timestamps null: false
    end
  end
end
