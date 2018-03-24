class Account < ActiveRecord::Base
  has_many :stocks
  belongs_to :user 
end
