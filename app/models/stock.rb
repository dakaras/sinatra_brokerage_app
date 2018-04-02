class Stock < ActiveRecord::Base
  has_many :account_stocks
  has_many :accounts, through: :account_stocks
  validates :shares, numericality: { only_integer: true, greater_than: 0 }
end
