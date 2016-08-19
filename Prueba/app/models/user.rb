class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true, email: true
  validates :password, presence: true, length: { minimum: 8 }
  has_secure_password
  attr_accessor :remember_token

  def self.secure_string(string)
    cost = BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def self.generate_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = User.generate_token
    update_attribute(:token_digest, User.secure_string(remember_token))
  end

  def authenticated?(remember_token)
    return false if token_digest.nil?
    BCrypt::Password.new(token_digest).is_password?(remember_token)
  end

  def delete_cookie
    update_attribute(:token_digest, nil)
  end
end