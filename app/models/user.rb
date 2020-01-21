class User < ApplicationRecord
  has_secure_password
  has_secure_token :auth_token

  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, length: { minimum: 6, maximum: 20 }, on: :create
  validates :terms, acceptance: true

  attr_accessor :terms
end
