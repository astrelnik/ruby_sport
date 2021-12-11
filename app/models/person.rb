require 'bcrypt'

class Person < ApplicationRecord
  include BCrypt

  has_secure_password :password

  validates :firstname, presence: true, length: {minimum: 5}

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
