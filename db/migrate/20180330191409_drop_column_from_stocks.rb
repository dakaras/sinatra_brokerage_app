class DropColumnFromStocks < ActiveRecord::Migration[5.1]
  def change
    remove_column :stocks, :account_id, :integer
  end
end
