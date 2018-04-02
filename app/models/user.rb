class User < ActiveRecord::Base
  has_many :accounts
  has_secure_password
  validates_presence_of :username, :password, :email
  validates :username, uniqueness: true
  validates :password, length: {minimum: 3, maximum: 10}, confirmation: {message: "Password fields do not match."}
end
