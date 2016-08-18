class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true, email: true
  validates :password, presence: true, length: { minimum: 8 }
  has_secure_password
end