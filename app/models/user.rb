class User < ActiveRecord::Base
  has_many :accounts
  has_secure_password
  validates_presence_of :username, :password, :email
  validates :password, confirmation: true 
  validates :username, uniqueness: true
  validates_associated :accounts
end
