require 'bcrypt'

class Person < ApplicationRecord
  include BCrypt

  has_secure_password :password

  validates :firstname, presence: true, length: {minimum: 5}
  validates :lastname, presence: true, length: {minimum: 5}
  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'Invalid email' }
  validates :password, presence: true, length: {minimum: 8}

  # def password
  #   @password ||= Password.new(password_hash)
  # end
  #
  # def password=(new_password)
  #   @password = Password.create(new_password)
  #   self.password_hash = @password
  # end
  def password_digest

  end
end
