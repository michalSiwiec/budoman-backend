# frozen_string_literal: true

class User < ApplicationRecord
  include Regex::User

  validates :email,
            uniqueness: { message: 'is already taken!' },
            format: { with: EMAIL, message: 'has incorrect format!' }
  validates :password,
            format: { with: PASSWORD, message: 'must be at least 6 characters and include one number and one letter.' }
  validates_with UserValidator, fields: [:avatars]

  has_many :opinions
  has_many :orders
end
