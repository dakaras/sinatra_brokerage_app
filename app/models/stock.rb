class Stock < ActiveRecord::Base
  has_many :account_stocks
  has_many :accounts, through: :account_stocks
end
