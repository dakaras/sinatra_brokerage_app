class Account < ActiveRecord::Base
  has_many :stocks
  belongs_to :user
  validates_presence_of :name, :category
end
