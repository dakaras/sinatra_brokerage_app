class Account < ActiveRecord::Base
  has_many :account_stocks
  has_many :stocks, through: :account_stocks
  belongs_to :user
  validates_presence_of :name, :category
end
