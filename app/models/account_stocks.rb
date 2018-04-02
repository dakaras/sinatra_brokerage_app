class AccountStock < ActiveRecord::Base
  belongs_to :account
  belongs_to :stock
end
